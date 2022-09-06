import 'package:flutter/material.dart';
import 'package:meal_app/modules/caegory_screen.dart';
import 'package:meal_app/modules/favourites_screen.dart';
import 'package:meal_app/modules/main_drawer.dart';

import '../models/meal.dart';

class BtmScreen extends StatefulWidget {

  final List<Meal> favMeal;

  const BtmScreen(this.favMeal);
  @override
  State<BtmScreen> createState() => _BtmScreenState();
}

class _BtmScreenState extends State<BtmScreen> {
  int curIndex = 0;
  void changeBtmBarIndex (int index){
    setState(() {
      curIndex = index;
    });
  }

  List<String> title = [
    'Categories',
    'Favourites',
  ];

  late List<Widget> pages;

  @override
  void initState() {
    // TODO: implement initState

    pages = [
      CategoriesScreen(),
      FavouritesScreen(widget.favMeal),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title[curIndex],
          style: TextStyle(
            fontFamily: 'Raleway'
          ),
        ),
      ),
      body: pages[curIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: curIndex,
        onTap: changeBtmBarIndex,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
