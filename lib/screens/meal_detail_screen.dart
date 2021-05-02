import 'package:flutter/material.dart';
import 'package:multiscreen/dummy_data.dart';

class Mealdetailscreen extends StatelessWidget {
  static const routename = '/meal-detail';
  Widget buildsectiontitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildcontainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    final selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedmeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedmeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildsectiontitle(context, 'INGREDIENTS'),
            buildcontainer(
              ListView.builder(
                itemCount: selectedmeal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedmeal.ingredients[index]),
                  ),
                ),
              ),
            ),
            buildsectiontitle(context, 'steps'),
            buildcontainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(selectedmeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedmeal.ingredients.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
