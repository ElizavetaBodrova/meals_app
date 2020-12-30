import 'package:flutter/cupertino.dart';

class Filter extends ChangeNotifier {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void setFilter(Map<String, bool> filterData) {
    _filters = filterData;

    notifyListeners();
  }
  void setFilterbyKey(String key, bool filter) {
    if(_filters.containsKey(key)){
      _filters[key]=filter;
    }

    notifyListeners();
  }

  Map<String, bool> filters() => _filters;
}