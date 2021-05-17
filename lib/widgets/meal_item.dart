import 'package:flutter/material.dart';
import 'package:menu_masters/models/meal.dart';

class MealItem extends StatelessWidget {
  static const routeName = '/meal-detail';
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeMealItem;
  const MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.removeMealItem,
  });

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealItem.routeName,
      arguments: {
        'id': id,
        'title': title,
        'imageUrl': imageUrl,
        'duration': duration,
        'complexity': complexity.toString(),
        'affordability': affordability.toString(),
      },
    ).then((value) {
      if (value != null) {
        removeMealItem(value);
      }
    });
  }

  String get complexityText {
    if (complexity == Complexity.Simple) {
      return 'Simple';
    } else if (complexity == Complexity.Challenging) {
      return 'Challenging';
    } else if (complexity == Complexity.Simple) {
      return 'Simple';
    }
    return 'Unknown';
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => (selectMeal(context)),
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
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.white54,
                    width: MediaQuery.of(context).size.width - 80,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Container(
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.timer,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '$duration mins',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.work,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '$complexityText',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '$affordabilityText',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
