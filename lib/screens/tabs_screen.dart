import 'package:flutter/material.dart';
import 'package:multiscreen/screens/categories_screen.dart';
import 'package:multiscreen/screens/fav_screen.dart';
import 'package:multiscreen/widgets/main_drawer.dart';

class Tabscreen extends StatefulWidget {
  @override
  _TabscreenState createState() => _TabscreenState();
}

class _TabscreenState extends State<Tabscreen> {
  final List<Map<String, Object>> _pages = [
    {'page': Categoriescreen(), 'title': 'Categories',},
    {'page': Favscreen(), 'title': 'Fav',},
  ];
  int _selectedpageindex = 0;
  void _selectpage(int index) {
    setState(() {
      _selectedpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedpageindex]['title']),
      ),
      drawer: Maindrawer(),
      body: _pages[_selectedpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedpageindex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('favourites'),
          ),
        ],
      ),
    );
  }
}
