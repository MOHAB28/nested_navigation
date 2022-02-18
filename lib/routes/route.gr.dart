// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i8;

import '../layout.dart' as _i1;
import '../screens/categories_page.dart' as _i5;
import '../screens/category_product_page.dart' as _i6;
import '../screens/favorite_page.dart' as _i7;
import '../screens/products_page.dart' as _i3;
import '../screens/single_product_page.dart' as _i4;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    LayoutRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LayoutPage());
    },
    ProductsRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    CategoriesRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    FavoriteRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    ProductsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ProductsPage());
    },
    SingleProductRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SingleProductRouteArgs>(
          orElse: () =>
              SingleProductRouteArgs(product: pathParams.get('product')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.SingleProductPage(key: args.key, product: args.product));
    },
    CategoriesRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.CategoriesPage());
    },
    CategoryProductRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CategoryProductRouteArgs>(
          orElse: () => CategoryProductRouteArgs(
              categoryName: pathParams.getString('categoryName')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.CategoryProductPage(
              key: args.key, categoryName: args.categoryName));
    },
    Favoritepage.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.Favoritepage());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(LayoutRoute.name, path: '/', children: [
          _i2.RouteConfig(ProductsRouter.name,
              path: 'products',
              parent: LayoutRoute.name,
              children: [
                _i2.RouteConfig(ProductsRoute.name,
                    path: '', parent: ProductsRouter.name),
                _i2.RouteConfig(SingleProductRoute.name,
                    path: ':product', parent: ProductsRouter.name)
              ]),
          _i2.RouteConfig(CategoriesRouter.name,
              path: 'categories',
              parent: LayoutRoute.name,
              children: [
                _i2.RouteConfig(CategoriesRoute.name,
                    path: '', parent: CategoriesRouter.name),
                _i2.RouteConfig(CategoryProductRoute.name,
                    path: ':categoryName', parent: CategoriesRouter.name),
                _i2.RouteConfig(SingleProductRoute.name,
                    path: ':product', parent: CategoriesRouter.name)
              ]),
          _i2.RouteConfig(FavoriteRouter.name,
              path: 'favorites',
              parent: LayoutRoute.name,
              children: [
                _i2.RouteConfig(Favoritepage.name,
                    path: '', parent: FavoriteRouter.name),
                _i2.RouteConfig(SingleProductRoute.name,
                    path: ':product', parent: FavoriteRouter.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.LayoutPage]
class LayoutRoute extends _i2.PageRouteInfo<void> {
  const LayoutRoute({List<_i2.PageRouteInfo>? children})
      : super(LayoutRoute.name, path: '/', initialChildren: children);

  static const String name = 'LayoutRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class ProductsRouter extends _i2.PageRouteInfo<void> {
  const ProductsRouter({List<_i2.PageRouteInfo>? children})
      : super(ProductsRouter.name, path: 'products', initialChildren: children);

  static const String name = 'ProductsRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class CategoriesRouter extends _i2.PageRouteInfo<void> {
  const CategoriesRouter({List<_i2.PageRouteInfo>? children})
      : super(CategoriesRouter.name,
            path: 'categories', initialChildren: children);

  static const String name = 'CategoriesRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class FavoriteRouter extends _i2.PageRouteInfo<void> {
  const FavoriteRouter({List<_i2.PageRouteInfo>? children})
      : super(FavoriteRouter.name,
            path: 'favorites', initialChildren: children);

  static const String name = 'FavoriteRouter';
}

/// generated route for
/// [_i3.ProductsPage]
class ProductsRoute extends _i2.PageRouteInfo<void> {
  const ProductsRoute() : super(ProductsRoute.name, path: '');

  static const String name = 'ProductsRoute';
}

/// generated route for
/// [_i4.SingleProductPage]
class SingleProductRoute extends _i2.PageRouteInfo<SingleProductRouteArgs> {
  SingleProductRoute({_i8.Key? key, required dynamic product})
      : super(SingleProductRoute.name,
            path: ':product',
            args: SingleProductRouteArgs(key: key, product: product),
            rawPathParams: {'product': product});

  static const String name = 'SingleProductRoute';
}

class SingleProductRouteArgs {
  const SingleProductRouteArgs({this.key, required this.product});

  final _i8.Key? key;

  final dynamic product;

  @override
  String toString() {
    return 'SingleProductRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i5.CategoriesPage]
class CategoriesRoute extends _i2.PageRouteInfo<void> {
  const CategoriesRoute() : super(CategoriesRoute.name, path: '');

  static const String name = 'CategoriesRoute';
}

/// generated route for
/// [_i6.CategoryProductPage]
class CategoryProductRoute extends _i2.PageRouteInfo<CategoryProductRouteArgs> {
  CategoryProductRoute({_i8.Key? key, required String categoryName})
      : super(CategoryProductRoute.name,
            path: ':categoryName',
            args:
                CategoryProductRouteArgs(key: key, categoryName: categoryName),
            rawPathParams: {'categoryName': categoryName});

  static const String name = 'CategoryProductRoute';
}

class CategoryProductRouteArgs {
  const CategoryProductRouteArgs({this.key, required this.categoryName});

  final _i8.Key? key;

  final String categoryName;

  @override
  String toString() {
    return 'CategoryProductRouteArgs{key: $key, categoryName: $categoryName}';
  }
}

/// generated route for
/// [_i7.Favoritepage]
class Favoritepage extends _i2.PageRouteInfo<void> {
  const Favoritepage() : super(Favoritepage.name, path: '');

  static const String name = 'Favoritepage';
}
