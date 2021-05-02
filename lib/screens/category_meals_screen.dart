import 'package:flutter/material.dart';
import 'package:multiscreen/widgets/meal_item.dart';
import '../dummy_data.dart';

class Categorymealscreen extends StatelessWidget {
  static const routname = '/category-meals';
  // final String categoryid;
  // final String categorytitle;

  // Categorymealscreen(this.categoryid,this.categorytitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categorytitle = routeArgs['title'];
    final categoryid = routeArgs['id'];
    final categorymeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryid);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Mealitem(
              id: categorymeals[index].id,
              title: categorymeals[index].title,
              imageurl: categorymeals[index].imageUrl,
              affordability: categorymeals[index].affordability,
              complexity: categorymeals[index].complexity,
              duration: categorymeals[index].duration);
        },
        itemCount: categorymeals.length,
      ),
    );
  }
}
