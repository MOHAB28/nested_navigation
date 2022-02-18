import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/category_product.dart';
import '../widgets/product_item.dart';

class CategoryProductPage extends StatelessWidget {
  const CategoryProductPage({
    Key? key,
    @PathParam() required this.categoryName,
  }) : super(key: key);
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    Provider.of<CategoryProduct>(context, listen: false)
        .getAllProducts(categoryName: categoryName);
    final products = Provider.of<CategoryProduct>(context).categoryProductItem;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(categoryName),
      // ),
      body: products.isNotEmpty
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
            ),
    );
  }
}
