// ignore_for_file: deprecated_member_use
import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../app/app.locator.dart';
import '../app/app.logger.dart';
import '../app/app.router.dart';
import '../models/hive_models/hive_table.dart';
import '../services/services.dart';
import '../shared/shared.dart';

class StartUpViewModel extends ReactiveViewModel {
  final log = getLogger('StartUpViewModel');

  final _navService = locator<NavigationService>();
  final _apiRootService = locator<ApiRootService>();
  final _hiveDbService = locator<HiveDbService>();

  bool _startAnimation = true;
  bool get startAnimation => _startAnimation;

  HiveTable get selectedHiveTable => _hiveDbService.selectedHiveTable;

  /// FIRES startup view animation
  Future<void> runStartupLogic() async {
    log.i('===== runStartupLogic() STARTED =====');

    await Future.delayed(const Duration(milliseconds: 2500)).then((value) {
      _startAnimation = false;
      notifyListeners();
    });

    log.i('===== runStartupLogic() ENDED =====');
  }

  /// AFTER startup view animation is finished, navigation to next view is implemented
  Future<void> navToHomeWithConnection(Locale initLocale) async {
    log.i('===== navToHomeWithConnection() STARTED =====');

    /// So this below condition is to change lang of API initialization to ru lang when app is opened for the first time. Workaround for an issue of easy_localization package.
    if (initLocale.toString() == 'ru_RU') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final savedLocale = prefs.getString(Constants.savedLocale) ??
          'en_US'; // GETS saved locale.

      if (savedLocale != 'ru_RU') {
        await prefs.setString(Constants.savedLocale, initLocale.toString());
      }
    }

    await _apiRootService.initializeDio();
    await _hiveDbService.initializeHiveBoxes();
    _hiveDbService.getHiveTable();
    _hiveDbService.getCartMeals();

    if (selectedHiveTable.id != -1) {
      await _navService.replaceWith(Routes.homeView);
    } else {
      await _navService.replaceWith(Routes.tablesView);
    }
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_hiveDbService];
}
