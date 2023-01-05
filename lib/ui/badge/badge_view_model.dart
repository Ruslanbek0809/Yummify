import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.logger.dart';
import '../../app/app.router.dart';
import '../../models/hive_models/hive_meal.dart';
import '../../services/services.dart';

class BadgeViewModel extends ReactiveViewModel {
  final log = getLogger('BadgeViewModel');

  final _navService = locator<NavigationService>();
  final _hiveDbService = locator<HiveDbService>();

  List<HiveMeal> get cartMeals => _hiveDbService.cartMeals;

//------------------------ NAVIGATIONS ----------------------------//

  Future<void> navToCartView() async =>
      await _navService.navigateTo(Routes.cartView);

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_hiveDbService];
}
