import 'package:flutter/material.dart';
import 'package:menu_masters/models/meal.dart';
import 'package:menu_masters/screens/filters_screen.dart';
import 'package:menu_masters/screens/tabs_screen.dart';
import './data/dummy_data.dart';
import './screens/meal_detail_screen.dart';
import './widgets/meal_item.dart';
import './screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegeterian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Masters',
      theme: ThemeData(
        primarySwatch: myPrimaryColor,
        accentColor: myAccentColor,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Colors.black,
            ),
            bodyText2: TextStyle(
              color: Colors.black,
            ),
            headline6: TextStyle(
              fontSize: 20,
              color: myAccentColor,
              fontFamily: 'RobotoCondensed-Bold',
            )),
      ),
      home: TabsScreen(),
      routes: {
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealItem.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters, setFilters),
      },
    );
  }
}
