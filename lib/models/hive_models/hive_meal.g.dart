// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_meal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveMealAdapter extends TypeAdapter<HiveMeal> {
  @override
  final int typeId = 0;

  @override
  HiveMeal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveMeal(
      id: fields[0] as int?,
      name: fields[1] as String?,
      image: fields[2] as String?,
      price: fields[3] as num?,
      quantity: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveMeal obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveMealAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
