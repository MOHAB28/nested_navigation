import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../provider/products.dart';
import 'product_item.dart';

class FavProductItem extends StatelessWidget {
  FavProductItem({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;
  AllProductModel? productModel;
  @override
  Widget build(BuildContext context) {
    Provider.of<Products>(context).productItems.forEach((element) {
      if (element.id == id) {
        productModel = element;
      }
    });

    return ProductItemBuilder(
      product: productModel!,
    );
  }
}
