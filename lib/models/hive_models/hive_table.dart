import 'package:hive/hive.dart';

part 'hive_table.g.dart';

@HiveType(typeId: 1)
class HiveTable {
  HiveTable({
    this.id,
    this.name,
  });

  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? name;
}
