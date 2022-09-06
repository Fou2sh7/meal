import 'package:flutter/material.dart';
import 'package:meal_app/modules/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.restaurant , size: 26,),
            title: Text(
              'Meals',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: (){
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.filter_vintage_rounded , size: 26,),
            title: Text(
              'Filters',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: (){
              Navigator.of(context).pushNamed(FiltersScreen.routeName);
            },
          ),

          // buildListTile(Icons.filter_vintage_rounded, 'Filters', (){
          //   Navigator.of(context).pushNamed(FiltersScreen.routeName);
          // }),
        ],
      ),
    );
  }
}
