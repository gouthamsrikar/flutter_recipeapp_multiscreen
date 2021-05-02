

import 'package:flutter/material.dart';
import 'package:multiscreen/models/meal.dart';
import '../screens/meal_detail_screen.dart';

class Mealitem extends StatelessWidget {
  final String id;
  final String title;
  final String imageurl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  Mealitem(
      {@required this.id,
        @required this.title,
      @required this.imageurl,
      @required this.affordability,
      @required this.complexity,
      @required this.duration});

  String get complexitytext {
    switch (complexity) {
      case Complexity.Simple:
        return 'simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'unknown';
    }
  }

  String get affordabilitytext {
    switch (affordability) {
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Affordable:
        return 'Affordable';
        break;
      default:
        return 'unknown';
    }
  }

  void selectmeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(Mealdetailscreen.routename,arguments: id);
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectmeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  imageurl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 26, color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ]),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(complexitytext),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(affordabilitytext),
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
