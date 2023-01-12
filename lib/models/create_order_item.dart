import 'package:json_annotation/json_annotation.dart';

part 'create_order_item.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateOrderItem {
  CreateOrderItem({
    this.mealId,
    this.quantity,
  });

  @JsonKey(name: 'meal_id')
  final int? mealId;

  @JsonKey(name: 'quantity')
  final int? quantity;

  factory CreateOrderItem.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderItemToJson(this);
}
