import 'package:flutter/material.dart';
import 'package:multiscreen/screens/categories_screen.dart';
import 'package:multiscreen/screens/category_meals_screen.dart';
import 'package:multiscreen/screens/meal_detail_screen.dart';
import 'package:multiscreen/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => Tabscreen(),
        Categorymealscreen.routname: (ctx) => Categorymealscreen(),
        Mealdetailscreen.routename:(ctx)=> Mealdetailscreen(),
      },
      // onGenerateRoute: (settings){
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder:(ctx)=> Categoriescreen());
      // },
     
    );
  }
}
