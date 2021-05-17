import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: GridView(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: DUMMY_CATEGORIES.map((catData) {
            return CategoryItem(catData.id, catData.title, catData.color);
          }).toList(),
        ),
      ),
    );
  }
}
