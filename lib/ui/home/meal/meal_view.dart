import 'package:flutter/material.dart';
import '../../../models/models.dart';
import 'meal_hook.dart';
import 'meal_view_model.dart';
import 'package:stacked/stacked.dart';

/// The reason to use this StatelessWidget instead of directly using MealHook structure is to create MealViewModel first using ViewModelBuilder
class MealView extends StatelessWidget {
  final MealModel meal;
  const MealView({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MealViewModel>.reactive(
      builder: (context, model, child) => MealHook(meal: meal),
      viewModelBuilder: () => MealViewModel(meal),
    );
  }
}
