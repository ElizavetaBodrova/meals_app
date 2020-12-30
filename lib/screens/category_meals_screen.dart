import 'package:flutter/material.dart';
import 'package:meals_app/models/filter.dart';
import 'package:provider/provider.dart'as p;

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    String categoryId = routeArgs['id'];
    Map<String, bool> filters = p.Provider.of<Filter>(context).filters();
    final availableMealForThisCategory = p.Provider.of<List<Meal>>(context);
    final displayedMeals = availableMealForThisCategory.where((element) {
        if (filters['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] && !element.isVegan) {
          return false;
        }
        if (filters['vegetarian'] && !element.isVegetarian) {
          return false;
        }

      return element.categories.contains(categoryId);
    }).toList();

    String categoryTitle = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            index: availableMealForThisCategory.indexOf(displayedMeals[index]),
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
