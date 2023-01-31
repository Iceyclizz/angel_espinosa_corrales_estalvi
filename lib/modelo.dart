import 'package:crud_framework/costmodel.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'CRUD_base/CRUD_model_base.dart';
import 'costadapter.dart';


class Modelo {
  static final Modelo _modelo = Modelo._internal();
  final CostModel _costModel= CostModel();
  factory Modelo() {
    return _modelo;
  }

  Modelo._internal();

  void add<T>(T item) {
    switch (T) {
      case Cost:_costModel.addItem(item as Cost);
      break;
      default:
        throw UnimplementedError("Type ${T.toString()} not supported.");
    }
  }

  void delete<T>(T item) {
    switch (T) {
      case Cost:_costModel.deleteItem(item as Cost);
      break;
      default:
        throw UnimplementedError("Type ${T.toString()} not supported.");
    }
  }

  void updateItem<T>(T item) {
     switch (T) {
      case Cost:_costModel.deleteItem(item as Cost);
      break;
      default:
        throw UnimplementedError("Type ${T.toString()} not supported.");
    }
  }

  List<T> getAll<T>() {
    switch (T) {
      case Cost:
      return _costModel.datos.values.toList().cast();
      default:
        throw UnimplementedError("Type ${T.toString()} not supported.");
    }
  }
  List<int> getIDs<T>() {
    switch (T) {
      case Cost:
      return _costModel.datos.entries.toList().cast();
      default:
        throw UnimplementedError("Type ${T.toString()} not supported.");
    }
  }

  T? get<T extends Item>(dynamic codigo) {
    switch (T) {
      default:
        throw UnimplementedError("Type ${T.toString()} not supported.");
    }
  }

  Future<void> initapp() async {
    await Hive.initFlutter();
      Hive
        ..registerAdapter(CostAdapter())
        ..registerAdapter(CategoriaAdapter())
        ..registerAdapter(TipusCostAdapter());
      Box box = await Hive.openBox('costapp');
      List<Cost> costs = box.get('costs')?.cast<Cost>() ?? <Cost>[];
      for (Cost c in costs) {
        add(c);
      }
  }
  double getahorros(){
    return _costModel.calcahorros();
  }
}
