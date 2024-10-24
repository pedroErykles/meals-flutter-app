import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/category_screens.dart';
import 'package:meals/screens/meals_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tab_screens.dart';
import 'package:meals/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings(false, false, false, false);
  final List<Meal> _favoriteMeals = [];
  List<Meal> _avaiableMeals = dummyMeals;

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _avaiableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        final filterResultCondensed =
            !(filterVegetarian || filterGluten || filterLactose || filterVegan);

        return filterResultCondensed;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Let\'s cook?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade400),
        useMaterial3: true,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        primaryColorLight: const Color.fromARGB(255, 235, 245, 197),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => TabScreens(
              favoriteMeals: _favoriteMeals,
            ),
        AppRoutes.CATEGORY_MEALS: (ctx) => CategoriesMealsScreen(
              avaiableMeals: _avaiableMeals,
            ),
        AppRoutes.MEAL_DETAILS: (ctx) => MealsDetailScreen(
              onToggleFavorite:  _toggleFavorite, isFavorite: _isFavorite
            ),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(
              settings: settings,
              onSettingsChanged: _filterMeals,
            ),
      },
      /*onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => const CategoryScreen(),
        );
      },
      */
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => const CategoryScreen(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Let\'s cook',
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: const Center(
        child: Text('Navigate is necessary!!!'),
      ),
    );
  }
}
