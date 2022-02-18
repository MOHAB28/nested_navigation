import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:revision/routes/route.gr.dart';

import '../models/product.dart';
import '../provider/favorites.dart';

class ProductItemBuilder extends StatelessWidget {
  const ProductItemBuilder({
    Key? key,
    required this.product,
  }) : super(key: key);

  final AllProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(
          SingleProductRoute(
            product: product,
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 220,
            height: 130,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 20.0,
                  blurRadius: 50.0,
                  offset: const Offset(1.0, 1.0),
                ),
              ],
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${product.title}'.substring(0, 6),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text('\$${product.price}'),
                      ],
                    ),
                    Consumer<Favorites>(
                      builder: ((context, value, child) {
                        if (value.items.contains(product.id)) {
                          return const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 25.0,
                          );
                        } else {
                          return const Icon(
                            Icons.favorite_outline_outlined,
                            color: Colors.red,
                            size: 25.0,
                          );
                        }
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            right: 40,
            child: Image.network(
              '${product.image}',
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
