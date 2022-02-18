import 'package:auto_route/auto_route.dart';
import 'package:revision/screens/categories_page.dart';
import 'package:revision/screens/single_product_page.dart';
import '../layout.dart';
import '../screens/category_product_page.dart';
import '../screens/favorite_page.dart';
import '../screens/products_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route', 
  routes: <AutoRoute>[
  AutoRoute(
    path: '/',
    page: LayoutPage,
    children: [
      AutoRoute(
        path: 'products',
        name: 'ProductsRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: ProductsPage,
          ),
          AutoRoute(
            path: ':product',
            page: SingleProductPage,
          ),
        ],
      ),
      AutoRoute(
        path: 'categories',
        name: 'CategoriesRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: CategoriesPage,
          ),
          AutoRoute(
            path: ':categoryName',
            page: CategoryProductPage,
          ),
          AutoRoute(
            path: ':product',
            page: SingleProductPage,
          ),
        ],
      ),
      AutoRoute(
        path: 'favorites',
        name: 'FavoriteRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: Favoritepage,
          ),
          AutoRoute(
            path: ':product',
            page: SingleProductPage,
          ),
        ],
      ),
    ],
  ),
])
class $AppRouter {}
