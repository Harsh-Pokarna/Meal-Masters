import 'package:flutter/material.dart';
import 'package:menu_masters/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 70),
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Let\'s start the fun',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
              leading: Icon(
                Icons.restaurant,
                color: Theme.of(context).accentColor,
                size: 26,
              ),
              title: Text(
                'Meals',
                style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(FilterScreen.routeName);
              },
              leading: Icon(
                Icons.sort,
                color: Theme.of(context).accentColor,
                size: 26,
              ),
              title: Text(
                'Filters',
                style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
