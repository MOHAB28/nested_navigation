import 'package:flutter/foundation.dart';

class Favorites extends ChangeNotifier {
  final List<int> _favoriteItems = [];
  List<int> get items {
    return [..._favoriteItems];
  }
  void add(int id) {
    _favoriteItems.add(id);
    notifyListeners();
  }
  void remove(int id) {
    _favoriteItems.remove(id);
    notifyListeners();
  }
}