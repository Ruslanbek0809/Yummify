import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../models/models.dart';
import '../../../services/api_service.dart';

class CategoryViewModel extends FutureViewModel {
  final log = getLogger('CategoryViewModel');

  final CategoryModel categoryModel;
  CategoryViewModel(this.categoryModel);

  final _api = locator<ApiService>();

  List<MealModel> _categoryMeals = [];
  List<MealModel> get categoryMeals => _categoryMeals;

  /// GET METHOD 2 for FUTUREVIEWMODEL
  @override
  Future<void> futureToRun() async => await getCatMeals();

  /// GETS Category meals
  Future getCatMeals() async {
    log.i('');
    await _api.getCategoryMeals(
      categoryId: categoryModel.id!,
      onSuccess: (result) => _categoryMeals = result,
      onFail: () {},
    );

    log.i('_categoryMeals.length: ${_categoryMeals.length}');
  }
}
