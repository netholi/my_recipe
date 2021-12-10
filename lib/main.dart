import 'package:flutter/material.dart';
import 'package:my_recipe/dummy_data.dart';
import 'package:my_recipe/models/meal.dart';
import 'package:my_recipe/screens/filters_screen.dart';
import 'package:my_recipe/screens/meal_detail_screen.dart';
import 'package:my_recipe/screens/tabs_screen.dart';

import 'package:my_recipe/screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) return false;
        if (_filters['lactose']! && !meal.isLactoseFree) return false;
        if (_filters['vegetarian']! && !meal.isVegetarian) return false;
        if (_filters['vegan']! && !meal.isVegan) return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Recipe',
      theme: ThemeData(
        fontFamily: 'Raleway',
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
        ).copyWith(
          secondary: Colors.tealAccent,
        ),
        textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.amber),
            bodyText2: TextStyle(color: Colors.black),
            subtitle1: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold)),
      ),
      // home: const MyHomePage(),
      initialRoute: '/', //default is'/'
      routes: {
        '/': (ctx) => TabsScreen(), //   '/' is home
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => TabsScreen(),
        );
      },
    );
  }
}
