import 'package:hive/hive.dart';
part 'hive_meal.g.dart';

/// Added quantity
@HiveType(typeId: 0)
class HiveMeal {
  HiveMeal({
    this.id,
    this.name,
    this.image,
    this.price,
    this.quantity,
  });

  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? image;

  @HiveField(3)
  final num? price;

  @HiveField(4)
  int? quantity;
}
