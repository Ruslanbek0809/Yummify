import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/models.dart';
import 'services.dart';
import '../app/app.locator.dart';
import '../app/app.logger.dart';

/// ApiService is a service for REST APIs used in this app
class ApiService {
  final log = getLogger('ApiService');

  final apiRootService = locator<ApiRootService>();

  //------------------ TABLES APIS ---------------------//

  /// GETS all existing tables from server
  Future<List<TableModel>> getTables() async {
    List<TableModel> tables = [];
    try {
      Response response = await apiRootService.dio.get('tables/');
      log.v('RESPONSE: api/tables/ => ${response.data}');

      if (response.data != null && response.statusCode == 200) {
        for (final singleTable in response.data) {
          tables.add(TableModel.fromJson(singleTable));
        }
      }

      return tables;
    } on DioError catch (error) {
      log.v('ERROR on api/tables/ :${error.response}');
      throw DioErrorType.response;
    }
  }

  //------------------ HOME APIS ---------------------//

  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> categories = [];
    try {
      Response response = await apiRootService.dio.get('categories/');
      // log.v('RESPONSE: api/categories/ => ${response.data}');

      if (response.data != null && response.statusCode == 200) {
        for (final mainCategory in response.data) {
          categories.add(CategoryModel.fromJson(mainCategory));
        }
      }
      return categories;
    } catch (error) {
      log.v('ERROR on api/categories/ :$error');
      rethrow;
    }
  }

  //------------------ CATEGORY APIS ---------------------//

  Future<void> getCategoryMeals({
    required int categoryId,
    Function(List<MealModel>)? onSuccess,
    Function()? onFail,
  }) async {
    List<MealModel> categoryMeals = [];
    try {
      Response response =
          await apiRootService.dio.get('categories/$categoryId/');
      // log.v('RESPONSE: api/categories/$categoryId/ => ${response.data}');

      if (response.data != null && response.statusCode == 200) {
        for (final categoryMeal in response.data) {
          categoryMeals.add(MealModel.fromJson(categoryMeal));
        }

        onSuccess!(categoryMeals);
      } else {
        onFail!();
      }
    } on DioError catch (error) {
      log.v('ERROR on api/categories/$categoryId/ :${error.response}');
      onFail!();
      throw DioErrorType.response;
    }
  }

  //------------------ CREATE ORDER API ---------------------//

  Future<void> createOrder(
    HiveTable hiveTable,
    List<HiveMeal> cartMeals,
    Function()? onSuccess,
    Function()? onFail,
  ) async {
    List<CreateOrderItem>? orderMeals = [];

    /// Step 1. For each cartMeal in cartMeals, creating and assigning to orderItemList
    for (HiveMeal cartMeal in cartMeals) {
      orderMeals.add(CreateOrderItem(
        mealId: cartMeal.id,
        quantity: cartMeal.quantity,
      ));
    }

    /// Step 2. CREATE new order
    CreateOrder createOrder = CreateOrder(
      tableId: hiveTable.id,
      orderMeals: orderMeals,
    );

    log.i('_createOrder.toJson(): ${createOrder.toJson()}');
    log.i('_createOrder with jsonEncode: ${jsonEncode(createOrder)}');

    try {
      Response response = await apiRootService.dio.post(
        'orders/',
        data: jsonEncode(
            createOrder), // Step 3. Instead of using formData I used jsonSerializable's toJson with built-in jsonEncode func
      );
      log.v('RESPONSE: orders/ => ${response.data}');

      if (response.data != null &&
          (response.statusCode == 200 || response.statusCode == 201)) {
        onSuccess!();
      } else {
        onFail!();
      }
    } on DioError catch (error) {
      log.v('ERROR orders/ with RESPONSE: ${error.response}');
      onFail!();
      throw DioErrorType.response;
    }
  }
}
