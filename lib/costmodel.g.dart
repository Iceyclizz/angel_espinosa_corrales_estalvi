// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'costmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoriaAdapter extends TypeAdapter<Categoria> {
  @override
  final int typeId = 2;

  @override
  Categoria read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Categoria.festa;
      case 1:
        return Categoria.viatge;
      case 2:
        return Categoria.nomina;
      case 3:
        return Categoria.capritxo;
      case 4:
        return Categoria.regal;
      default:
        return Categoria.festa;
    }
  }

  @override
  void write(BinaryWriter writer, Categoria obj) {
    switch (obj) {
      case Categoria.festa:
        writer.writeByte(0);
        break;
      case Categoria.viatge:
        writer.writeByte(1);
        break;
      case Categoria.nomina:
        writer.writeByte(2);
        break;
      case Categoria.capritxo:
        writer.writeByte(3);
        break;
      case Categoria.regal:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoriaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TipusCostAdapter extends TypeAdapter<TipusCost> {
  @override
  final int typeId = 3;

  @override
  TipusCost read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TipusCost.recurrent;
      case 1:
        return TipusCost.extraordinari;
      default:
        return TipusCost.recurrent;
    }
  }

  @override
  void write(BinaryWriter writer, TipusCost obj) {
    switch (obj) {
      case TipusCost.recurrent:
        writer.writeByte(0);
        break;
      case TipusCost.extraordinari:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TipusCostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
