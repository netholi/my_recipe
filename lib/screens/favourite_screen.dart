import 'package:flutter/material.dart';
import 'package:my_recipe/models/meal.dart';
import 'package:my_recipe/widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favorites;

  FavouriteScreen(this.favorites);

  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      return Center(
        child: Text('You have no favorites yet.. start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favorites[index].id,
            title: favorites[index].title,
            imageUrl: favorites[index].imageUrl,
            duration: favorites[index].duration,
            affordability: favorites[index].affordability,
            complexity: favorites[index].complexity,
          );
        },
        itemCount: favorites.length,
      );
    }
  }
}
