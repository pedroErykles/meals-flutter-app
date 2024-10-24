import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> avaiableMeals;
  const CategoriesMealsScreen({required this.avaiableMeals, super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category?;

    if (category != null) {
      final categoryMeals = avaiableMeals.where((meal) {
        return meal.categories.contains(category.id);
      }).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text(category.title),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: categoryMeals.isNotEmpty ? ListView.builder(
              itemCount: categoryMeals.length,
              itemBuilder: (context, index) {
                return MealItem(meal: categoryMeals[index]);
              }) : const Center(child: Text('No meals avaiable...'),)
        ),
      );
    }
    return const Center(
      child: Text('No categories'),
    );
  }
}
