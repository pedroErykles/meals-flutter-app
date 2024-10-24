import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({required this.category, super.key});

  void _selectCategory(BuildContext context) {
    /*Navigator.of(context).push(MaterialPageRoute(builder: (_){
      return CategoriesMealsScreen(category: category,);
    }),);
    */

    Navigator.of(context).pushNamed(AppRoutes.CATEGORY_MEALS.toString(), arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
                colors: [category.color.withOpacity(0.5), category.color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Text(
          category.title,
          style: const TextStyle(
              color: Colors.white70, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
