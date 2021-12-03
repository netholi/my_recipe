import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color bgColor;
  CategoryItem({required this.title, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
      padding: const EdgeInsets.all(15),
      child: Center(
          child: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      )),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [bgColor.withOpacity(.1), bgColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
