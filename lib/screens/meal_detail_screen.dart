import 'package:flutter/material.dart';
import 'package:my_recipe/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/Meal-Detail';

  Widget buildSectionTitle(BuildContext ctx, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.subtitle1,
      ),
    );
  }

  Widget buildConatiner(Widget child, {double contHeight = 150}) {
    return Container(
        height: contHeight,
        padding: EdgeInsets.all(3),
        // color: Colors.redAccent.withOpacity(.3),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.teal.shade100,
        ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildConatiner(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 2 - 0, vertical: 5),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildConatiner(
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('#${index + 1}'),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider(),
                      ],
                    );
                  },
                  itemCount: selectedMeal.steps.length,
                ),
                contHeight: 300),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
