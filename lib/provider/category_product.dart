
import 'package:flutter/foundation.dart';
import '../helpers/api.dart';

import '../models/product.dart';

class CategoryProduct with ChangeNotifier {
  List<AllProductModel> _categoryProductItem = [];
  List<AllProductModel> get categoryProductItem {
    return [..._categoryProductItem];
  }

  Future<void> getAllProducts({required String categoryName}) async {
    try {
      List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');
      final List<AllProductModel> loadedProducts = [];
      for (var element in data) {
        loadedProducts.add(
          AllProductModel.fromJson(element),
        );
      }
      _categoryProductItem = loadedProducts;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
