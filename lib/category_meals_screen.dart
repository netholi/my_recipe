import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categorTitle;

  CategoryMealsScreen({required this.categoryId, required this.categorTitle});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$categorTitle Recipe'),
      ),
      body: Center(
        child: Text('Meals for the selected catgory'),
      ),
    );
  }
}
