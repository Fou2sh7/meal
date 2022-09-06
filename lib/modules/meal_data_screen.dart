import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDataScreen extends StatelessWidget {

  static const routeName = 'meal_details';

  final Function toggleFavs;
  final Function isMealInFavorites;

  MealDataScreen(this.toggleFavs , this.isMealInFavorites);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeals = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);


    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeals.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(selectedMeals.imageUrl, fit: BoxFit.cover),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Ingredients',
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 22,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              height: 200,
              width: 300,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0),
                      child: Text(selectedMeals.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectedMeals.ingredients.length,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Steps',
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 22,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              height: 200,
              width: 300,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(selectedMeals.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedMeals.ingredients.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>toggleFavs(mealId),
        child: Icon(
            isMealInFavorites(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
