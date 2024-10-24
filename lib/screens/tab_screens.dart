import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/category_screens.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabScreens extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabScreens({required this.favoriteMeals, super.key});

  @override
  State<TabScreens> createState() => _TabScreensState();
}

class _TabScreensState extends State<TabScreens> {
  int _selectedIndex = 0;
  List<Map<String, Object>> _screens = [];


  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': 'Categories', 'screen': const CategoryScreen()},
      {
        'title': 'Favorites',
        'screen': FavoriteScreen(favoriteMeals: widget.favoriteMeals)
      },
    ];
  }

  _setIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedIndex]['title'] as String),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).primaryColorLight,
        onTap: _setIndex,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.category),
              label: const Text('Categories',
                      style: TextStyle(color: Colors.white))
                  .data),
          BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: const Text(
                'Favorites',
                style: TextStyle(color: Colors.white),
              ).data)
        ],
      ),
    );
  }
}
