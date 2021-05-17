import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildSectionTitle(BuildContext context, String text) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

    Widget buildContainer(Widget child) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).accentColor),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(20),
        height: 300,
        width: 500,
        child: child,
      );
    }

    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final mealId = routeArgs['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (meal) {
        return meal.id == mealId;
      },
    );
    // final mealTitle = routeArgs['title'];
    // final mealImageUrl = routeArgs['imageUrl'];
    // final mealDuration = routeArgs['duration'];
    // final mealComplexity = routeArgs['complexity'];
    // final mealAffordability = routeArgs['affordability'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title.toString(),
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    color: Theme.of(context).primaryColor,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: Text(
                        '${index + 1}.' +
                            '  ' +
                            selectedMeal.ingredients[index].toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).accentColor,
                        child: Text(
                          '#${index + 1}.',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).accentColor,
                    ),
                  ],
                );
              },
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        foregroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
