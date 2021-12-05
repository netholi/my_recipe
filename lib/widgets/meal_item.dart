import 'package:flutter/material.dart';
import 'package:my_recipe/models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  MealItem(
      {required this.title,
      required this.imageUrl,
      required this.affordability,
      required this.complexity});

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


// to test container position
// margin: EdgeInsets.all(3),
//       height: 100,
//       color: Colors.redAccent.withOpacity(.3),