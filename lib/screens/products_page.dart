import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';

import '../widgets/product_item.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<Products>(context, listen: false).getAllProducts();
    final products = Provider.of<Products>(context).productItems;
    return products.isNotEmpty
        ? GridView.builder(
            itemCount: products.length,
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              top: 65.0,
            ),
            clipBehavior: Clip.none,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 100.0,
            ),
            itemBuilder: (ctx, i) {
              return ProductItemBuilder(
                product: products[i],
              );
            },
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
