import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/categories.dart';
import 'package:auto_route/auto_route.dart';
import '../routes/route.gr.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<Categories>(context, listen: false).getAllCategories();
    final cat = Provider.of<Categories>(context).categoriesItems;
    return cat.isNotEmpty
        ? ListView.separated(
            itemCount: cat.length,
            itemBuilder: (ctx, i) {
              return ListTile(
                onTap: () {
                  context.router
                      .push(CategoryProductRoute(categoryName: cat[i]));
                },
                title: Text(
                  '${cat[i]}'.toUpperCase(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              );
            },
            separatorBuilder: (ctx, i) {
              return const SizedBox(height: 10);
            },
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
