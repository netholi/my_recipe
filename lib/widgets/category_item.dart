import 'package:flutter/material.dart';
import 'package:my_recipe/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color bgColor;
  CategoryItem({required this.id, required this.title, required this.bgColor});

  void selectCategory(BuildContext ctx) {
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    //   return CategoryMealsScreen(
    //     categoryId: id,
    //     categorTitle: title,
    //   );
    // }));

    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        //margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
        padding: const EdgeInsets.all(15),
        child: Center(
            child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        )),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [bgColor.withOpacity(.1), bgColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white),
        ),
      ),
    );
  }
}
