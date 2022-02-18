import 'package:flutter/foundation.dart';
import '../helpers/api.dart';
import '../models/product.dart';

class Products with ChangeNotifier {
  List<AllProductModel> _productItems = [];
  List<AllProductModel> get productItems {
    return [..._productItems];
  }



  Future<void> getAllProducts() async {
    try {
      List<dynamic> data =
          await Api().get(url: 'https://fakestoreapi.com/products');
      final List<AllProductModel> loadedProducts = [];
      for (var element in data) {
        loadedProducts.add(
          AllProductModel.fromJson(element),
        );
      }
      _productItems = loadedProducts;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addProduct(AllProductModel product) async {
    try {
      await Api().post(
        url: 'https://fakestoreapi.com/products',
        body: {
          'title': product.title,
          'price': product.price,
          'description': product.description,
          'category': product.category,
          'image': product.image,
        },
      );
      final newProduct = AllProductModel(
        id: product.id,
        title: product.title,
        price: product.price,
        description: product.description,
        category: product.category,
        image: product.image,
      );
      _productItems.add(newProduct);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateProduct(int id, AllProductModel product) async {
    final productIndex = _productItems.indexWhere((prod) => prod.id == id);
    if (productIndex > -1) {
      try {
        await Api().put(
          url: 'https://fakestoreapi.com/products/$id',
          body: {
            'title': product.title,
            'price': product.price,
            'description': product.description,
            'image': product.image,
            'category': product.category,
          },
        );
        _productItems[productIndex] = product;
        notifyListeners();
      } catch (e) {
        rethrow;
      }
    }
  }
}
