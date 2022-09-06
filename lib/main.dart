import 'package:flutter/material.dart';
import 'package:meal_app/modules/bottom_nav_bar_screen.dart';
import 'package:meal_app/modules/caegory_screen.dart';
import 'package:meal_app/modules/category_meal_screen.dart';
import 'package:meal_app/modules/filters_screen.dart';
import 'package:meal_app/modules/meal_data_screen.dart';

import 'dummy_data.dart';
import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Map<String , bool> filters = {
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegeterian' : false,
  };

  List<Meal> filteredMeals = DUMMY_MEALS;
  List<Meal> favouritesMeal = [];

  void setFilters(Map<String , bool> filterData) {
    setState(() {
      filters = filterData;
    });

    filteredMeals = DUMMY_MEALS.where((meal) {
      if(filters['gluten']! && !meal.isGlutenFree){
        return false;
      }
      else if(filters['lactose']! && !meal.isLactoseFree){
        return false;
      }
      else if(filters['vegan']! && !meal.isVegan){
        return false;
      }
      else if(filters['vegeterian']! && !meal.isVegetarian){
        return false;
      }
      return true;
    }).toList();
  }

  void toggleFavs(String meadId){
    final existingIndex = favouritesMeal.indexWhere((meal) => meal.id == meadId);

    if(existingIndex >= 0) {
      setState(() {
        favouritesMeal.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        favouritesMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == meadId));
      });
    }
  }

  bool isMealInFavourites(String meadId){
    return favouritesMeal.any((meal) => meal.id == meadId);
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1),
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1),
          ),
          // titleMedium: TextStyle(
          //   fontSize: 24,
          //   fontFamily: 'RobotoCondensed',
          //   fontWeight: FontWeight.bold,
          // ),
        ),
      ),
      // home: CategoriesScreen(),
      routes: {
        '/' : (context) => BtmScreen(favouritesMeal),
        CategoryMealsScreen.routeName : (context) => CategoryMealsScreen(filteredMeals),
        MealDataScreen.routeName : (context) => MealDataScreen(toggleFavs,isMealInFavourites),
        FiltersScreen.routeName : (context) => FiltersScreen(filters,setFilters),
      },
    );
  }
}