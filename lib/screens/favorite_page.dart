import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revision/provider/favorites.dart';

import '../widgets/favorite_product_item.dart';

class Favoritepage extends StatelessWidget {
  const Favoritepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = Provider.of<Favorites>(context).items;
    return id.isNotEmpty
        ? GridView.builder(
            itemCount: id.length,
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              top: 65.0,
            ),
            clipBehavior: Clip.none,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: id.length == 1 ? 1 : 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 100.0,
            ),
            itemBuilder: (ctx, i) {
              return FavProductItem(
                id: id[i],
              );
            },
          )
        : const Center(
            child: Text(
              'No products',
            ),
          );
  }
}
