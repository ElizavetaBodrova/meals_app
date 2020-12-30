import 'package:flutter/material.dart';
import 'package:meals_app/models/favorite.dart';
import 'package:provider/provider.dart'as p;

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen();

  @override
  Widget build(BuildContext context) {
    if (p.Provider.of<Favorite>(context).isEmpty()) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            index: p.Provider.of<List<Meal>>(ctx).indexOf(p.Provider.of<Favorite>(ctx).getMealFromIndex(index)),
          );
        },
        itemCount: p.Provider.of<Favorite>(context).length(),
      );
    }
  }
}
