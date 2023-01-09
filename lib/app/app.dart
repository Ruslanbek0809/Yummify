import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yummify/ui/tables/tables_view.dart';
import '../services/services.dart';
import '../ui/cart/cart.dart';
import '../ui/home/category/category_view.dart';
import '../ui/home/home_view.dart';
import '../ui/startup_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
    MaterialRoute(page: TablesView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: CategoryView),
    MaterialRoute(page: CartView),
    MaterialRoute(page: SuccessView),
  ],
  dependencies: [
    LazySingleton(classType: ApiRootService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: HiveDbService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
