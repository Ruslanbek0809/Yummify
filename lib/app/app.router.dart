// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../models/category_model.dart';
import '../ui/cart/cart_view.dart';
import '../ui/cart/success_view.dart';
import '../ui/home/category/category_view.dart';
import '../ui/home/home_view.dart';
import '../ui/startup_view.dart';
import '../ui/tables/tables_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String tablesView = '/tables-view';
  static const String homeView = '/home-view';
  static const String categoryView = '/category-view';
  static const String cartView = '/cart-view';
  static const String successView = '/success-view';
  static const all = <String>{
    startUpView,
    tablesView,
    homeView,
    categoryView,
    cartView,
    successView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.tablesView, page: TablesView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.categoryView, page: CategoryView),
    RouteDef(Routes.cartView, page: CartView),
    RouteDef(Routes.successView, page: SuccessView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartUpView(),
        settings: data,
      );
    },
    TablesView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const TablesView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    CategoryView: (data) {
      var args = data.getArgs<CategoryViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => CategoryView(
          categoryModel: args.categoryModel,
          key: args.key,
        ),
        settings: data,
      );
    },
    CartView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CartView(),
        settings: data,
      );
    },
    SuccessView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SuccessView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// CategoryView arguments holder class
class CategoryViewArguments {
  final CategoryModel categoryModel;
  final Key? key;
  CategoryViewArguments({required this.categoryModel, this.key});
}

/// ************************************************************************
/// Extension for strongly typed navigation
/// *************************************************************************

extension NavigatorStateExtension on NavigationService {
  Future<dynamic> navigateToStartUpView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.startUpView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToTablesView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.tablesView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToHomeView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.homeView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToCategoryView({
    required CategoryModel categoryModel,
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.categoryView,
      arguments: CategoryViewArguments(categoryModel: categoryModel, key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToCartView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.cartView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSuccessView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.successView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
