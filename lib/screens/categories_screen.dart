import 'package:flutter/material.dart';
import 'package:multiscreen/widgets/category_item.dart';
import '../models/category.dart';
import '../dummy_data.dart';

class Categoriescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('multiscreen'),),
      body: GridView(
        padding: const EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map((catdata) => Categoryitem(catdata.id,catdata.title, catdata.color))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          )),
    );
  }
}
