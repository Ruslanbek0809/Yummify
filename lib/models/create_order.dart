import 'package:json_annotation/json_annotation.dart';

import 'create_order_item.dart';

part 'create_order.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateOrder {
  CreateOrder({
    this.tableId,
    this.orderMeals,
  });

  @JsonKey(name: 'stol_id')
  final int? tableId;

  @JsonKey(name: 'meals')
  final List<CreateOrderItem>? orderMeals;

  factory CreateOrder.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderToJson(this);
}
