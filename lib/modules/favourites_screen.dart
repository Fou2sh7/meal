import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {

  final List<Meal> favMeal;

  const FavouritesScreen(this.favMeal);

  @override
  Widget build(BuildContext context) {

    if(favMeal.isEmpty){
      return Center(
        child: Text(
            'Favourites'
        ),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favMeal[index].id,
            title: favMeal[index].title,
            imageUrl: favMeal[index].imageUrl,
            duration: favMeal[index].duration,
            complexity: favMeal[index].complexity,
            affordability: favMeal[index].affordability,
          );
        },
        itemCount: favMeal.length,
      );
    }
  }
}
