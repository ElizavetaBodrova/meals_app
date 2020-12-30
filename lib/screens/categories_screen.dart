import 'package:flutter/material.dart';

import 'package:meals_app/models/category.dart';
import 'package:provider/provider.dart'as p;

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: List.generate(
        p.Provider.of<List<Category>>(context).length,
        (index) => CategoryItem(index),
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
