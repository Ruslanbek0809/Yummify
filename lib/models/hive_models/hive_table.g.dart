// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveTableAdapter extends TypeAdapter<HiveTable> {
  @override
  final int typeId = 1;

  @override
  HiveTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTable(
      id: fields[0] as int?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveTable obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
