import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:provider/provider.dart' as p;

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final int index;

  CategoryItem(this.index);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': p.Provider.of<List<Category>>(ctx, listen: false)[index].id,
        'title': p.Provider.of<List<Category>>(ctx, listen: false)[index].title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories=p.Provider.of<List<Category>>(context);
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          categories[index].title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              categories[index].color.withOpacity(0.7),
             categories[index].color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
