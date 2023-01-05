import '../../models/hive_models/hive_table.dart';
import '../../models/table_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.logger.dart';
import '../../app/app.router.dart';
import '../../services/services.dart';

class TablesViewModel extends FutureViewModel {
  final log = getLogger('TablesViewModel');

  final apiService = locator<ApiService>();
  final _hiveDbService = locator<HiveDbService>();
  final _navService = locator<NavigationService>();

  HiveTable get selectedHiveTable => _hiveDbService.selectedHiveTable;

  List<TableModel> _tables = [];
  List<TableModel> get tables => _tables;

  @override
  Future<void> futureToRun() async {
    _tables = await apiService.getTables();
    log.i('_tables.length: ${_tables.length}');
  }

  /// ADDS selected table to HIVE and NAVIGATES to HomeView
  Future<void> addTableToHive(TableModel tableModel) async {
    await _hiveDbService.updateTableInHive(tableModel);
    await _navService.pushNamedAndRemoveUntil(Routes.homeView);
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_hiveDbService];
}
