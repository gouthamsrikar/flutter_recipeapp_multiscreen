

import 'package:flutter/material.dart';

class Maindrawer extends StatelessWidget {
  Widget buildlisttile(String title,IconData icon){
    return ListTile(
            leading: Icon(
              icon,
              size: 26,
            ),
            title: Text(
              title,
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: Text(
              'cooking up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildlisttile('Meals', Icons.restaurant),
          buildlisttile('filters', Icons.settings),
          
        ],
      ),
    );
  }
}
