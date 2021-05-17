import 'package:flutter/material.dart';
import 'package:menu_masters/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color backgroundColor;
  CategoryItem(this.id, this.title, this.backgroundColor);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      onTap: () => selectCategory(context),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [backgroundColor.withOpacity(0.7), backgroundColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
