import 'package:hive_flutter/hive_flutter.dart';

import 'costmodel.dart';

class CostAdapter extends TypeAdapter<Cost> {
  @override
  final int typeId = 1;

  @override
  Cost read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cost(
      fields[0] as int,
      fields[1] as DateTime,
      fields[2] as Categoria,
      fields[3] as TipusCost,
      fields[4] as String,
      fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Cost obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(2)
      ..write(obj.categoria)
      ..writeByte(3)
      ..write(obj.tipo)
      ..writeByte(4)
      ..write(obj.concepte)
      ..writeByte(5)
      ..write(obj.quantitat)
      ..writeByte(0)
      ..write(obj.key);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}