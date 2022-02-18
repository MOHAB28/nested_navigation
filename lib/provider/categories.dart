
import 'package:flutter/foundation.dart';
import '../helpers/api.dart';

class Categories with ChangeNotifier {
  List<dynamic> _categoriesItems = [];
  List<dynamic> get categoriesItems {
    return [..._categoriesItems];
  }

  Future<void> getAllCategories() async {
    try {
      List<dynamic> data =
          await Api().get(url: 'https://fakestoreapi.com/products/categories');
      final List<dynamic> loadedProducts = [];
      for (var element in data) {
        loadedProducts.add(element);
      }
      _categoriesItems = loadedProducts;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
