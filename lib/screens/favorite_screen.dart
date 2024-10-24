import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen({required this.favoriteMeals, super.key});

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isNotEmpty
        ? ListView.builder(
            itemCount: favoriteMeals.length,
            itemBuilder: (ctx, index) {
              return MealItem(meal: favoriteMeals[index]);
            })
        : const Center(child: Text('No favorite meals avaiable'));
  }
}
