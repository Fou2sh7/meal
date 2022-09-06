import 'package:flutter/material.dart';
import 'package:meal_app/modules/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';

  final Function saveFilter;
  final Map<String, bool> filtersVal;

  FiltersScreen(this.filtersVal, this.saveFilter);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

  initState() {
    bool isGlutenFree = widget.filtersVal['gluten']!;
    bool isLactoseFree = widget.filtersVal['lactose']!;
    bool isVegan = widget.filtersVal['vegan']!;
    bool isVegetarian = widget.filtersVal['vegeterian']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
        ),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': isGlutenFree,
                'lactose': isLactoseFree,
                'vegan': isVegan,
                'vegeterian': isVegetarian,
              };

              widget.saveFilter();
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text(
                    'Gluten-Free',
                  ),
                  value: isGlutenFree,
                  subtitle: Text('Only Gluten Free Meals'),
                  onChanged: (newValue) {
                    setState(() {
                      isGlutenFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text(
                    'Lactose-Free',
                  ),
                  value: isLactoseFree,
                  subtitle: Text('Only Lactose Free Meals'),
                  onChanged: (newValue) {
                    setState(() {
                      isLactoseFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text(
                    'Vegan',
                  ),
                  value: isVegan,
                  subtitle: Text('Only Vegan Meals'),
                  onChanged: (newValue) {
                    setState(() {
                      isVegan = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text(
                    'Vegeterian',
                  ),
                  value: isVegetarian,
                  subtitle: Text('Only Vegeterian Meals'),
                  onChanged: (newValue) {
                    setState(() {
                      isVegetarian = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  Widget buildSwitchListTile(
      String title, bool currentValue, String describtion, Function newValue) {
    return SwitchListTile(
      title: Text(
        title,
      ),
      value: currentValue,
      subtitle: Text(describtion),
      onChanged: newValue(),
    );
  }
}
