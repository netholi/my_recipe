import 'package:flutter/material.dart';
import 'package:my_recipe/dummy_data.dart';
import 'package:my_recipe/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categorTitle;

  // CategoryMealsScreen({required this.categoryId, required this.categorTitle});

  @override
  Widget build(BuildContext context) {
    final routes =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String? categoryId = routes['id'];
    final String? categorTitle = routes['title'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('$categorTitle Recipe'),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
            );
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
