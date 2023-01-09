// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderItem _$CreateOrderItemFromJson(Map<String, dynamic> json) =>
    CreateOrderItem(
      mealId: json['meal_id'] as int?,
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$CreateOrderItemToJson(CreateOrderItem instance) =>
    <String, dynamic>{
      'meal_id': instance.mealId,
      'quantity': instance.quantity,
    };
