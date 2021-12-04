import 'package:flutter/material.dart';
import './categories_screen.dart';
import 'package:my_recipe/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        '/': (ctx) => MyHomePage(), //   '/' is home
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deli Meals'),
      ),
      body: Center(
        child: CategoriesScreen(),
      ),
    );
  }
}
