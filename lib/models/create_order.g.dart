// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrder _$CreateOrderFromJson(Map<String, dynamic> json) => CreateOrder(
      tableId: json['stol_id'] as int?,
      orderMeals: (json['meals'] as List<dynamic>?)
          ?.map((e) => CreateOrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateOrderToJson(CreateOrder instance) =>
    <String, dynamic>{
      'stol_id': instance.tableId,
      'meals': instance.orderMeals?.map((e) => e.toJson()).toList(),
    };
