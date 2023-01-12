import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.logger.dart';
import '../../app/app.router.dart';
import '../../generated/locale_keys.g.dart';
import '../../models/models.dart';
import '../../services/services.dart';
import '../../shared/shared.dart';

class HomeViewModel extends FutureViewModel {
  final log = getLogger('HomeViewModel');

  final _apiRootService = locator<ApiRootService>();
  final _api = locator<ApiService>();
  final _navService = locator<NavigationService>();
  final _hiveDbService = locator<HiveDbService>();

  String? _selectedLang;
  String? get selectedLang => _selectedLang;

  List<CategoryModel> _categories = [];
  List<CategoryModel> get categories => _categories;

  HiveTable get selectedHiveTable => _hiveDbService.selectedHiveTable;

  /// GET METHOD 1 for FUTUREVIEWMODEL
  @override
  Future<void> futureToRun() async {
    _categories = await _api.getCategories();
    log.v('_categories.length: ${_categories.length}');
  }

  /// SETS initial lang
  setInitialLang(BuildContext context) =>
      _selectedLang = context.locale == context.supportedLocales[0]
          ? LocaleKeys.lang_en
          : LocaleKeys.lang_ru;

  /// SETS LOCALE of an app's baseUrl
  Future<void> setLocale(String locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Constants.savedLocale, locale);
  }

  /// REINITIALIZES app api url
  Future<void> reinitializeDio() async => await _apiRootService
      .initializeDio(); // MUST REINITIALIZE whole app dio config

  //------------------ NAVIGATION ---------------------//

  /// NAVIGATES to Home by removing all previous routes
  Future<void> navToHomeByRemovingAll() async =>
      await _navService.pushNamedAndRemoveUntil(Routes.homeView);

  /// NAVIGATES to Category View
  Future<void> navToCategoryMealsView(CategoryModel categoryModel) async =>
      await _navService.navigateTo(
        Routes.categoryView,
        arguments: CategoryViewArguments(categoryModel: categoryModel),
      );

  /// NAVIGATES to Tables View
  Future<void> navToTablesView() async =>
      await _navService.navigateTo(Routes.tablesView);

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_hiveDbService];
}
