import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revision/provider/favorites.dart';


const _titleStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

const _bodyStyle = TextStyle(
  fontSize: 18.0,
);

class SingleProductPage extends StatelessWidget {
  const SingleProductPage({
    Key? key,
    @PathParam() required this.product,
  }) : super(key: key);
  final dynamic product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     '${product.title}'.substring(0, 6),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.network(
                      '${product.image}',
                      height: MediaQuery.of(context).size.height / 3,
                    ),
                    const SizedBox(height: 5.0),
                    CustomText(
                      product: '${product.title}',
                      title: 'Product Name',
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Price',
                          style: _titleStyle,
                        ),
                        Text(
                          '\$${product.price}',
                          style: _bodyStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    CustomText(
                      product: '${product.description}',
                      title: 'Product Description',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 60.0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width - 130,
                      color: Colors.grey,
                      child: const Center(
                        child: Text(
                          'Edit Product',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Consumer<Favorites>(
                    builder: ((context, value, child) {
                      return GestureDetector(
                        onTap: () {
                          if (value.items.contains(product.id)) {
                            value.remove(product.id!);
                          } else {
                            value.add(product.id!);
                          }
                        },
                        child: Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: value.items.contains(product.id)
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 25.0,
                                  )
                                : const Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.product,
    required this.title,
  }) : super(key: key);

  final String product;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Product Description',
          style: _titleStyle,
        ),
        const SizedBox(height: 5),
        Text(
          product,
          style: _bodyStyle,
        ),
      ],
    );
  }
}
