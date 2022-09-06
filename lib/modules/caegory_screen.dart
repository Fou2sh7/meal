import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(20),
        children: DUMMY_CATEGORIES.map((categoryData) =>
            CategoryItem(categoryData.id, categoryData.title, categoryData.color),
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
