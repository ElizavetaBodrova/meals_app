import 'package:flutter/cupertino.dart';

import 'meal.dart';

class Favorite extends ChangeNotifier {
  // Store only List<MealID> instead of List<Meal>
  final List<Meal> _favoriteMeals = [];

  bool isEmpty() => _favoriteMeals.isEmpty;
  int length() => _favoriteMeals.length;

  bool isMealFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    return existingIndex >= 0;
  }

  Meal getMealFromId(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    // if (existingIndex < 0) return Meal();
    return _favoriteMeals[existingIndex];
  }

  Meal getMealFromIndex(int mealIndex) => _favoriteMeals[mealIndex];

  void addOrRemoveToFavorite(Meal meal) {
    if (isMealFavorite(meal.id))
      removeFromFavorite(meal.id);
    else
      addToFavorite(meal);
  }

  void addToFavorite(Meal meal) {
    if (isMealFavorite(meal.id)) return;

    _favoriteMeals.add(meal);

    notifyListeners();
  }

  void removeFromFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (!isMealFavorite(mealId)) return;

    _favoriteMeals.removeAt(existingIndex);

    notifyListeners();
  }
}
