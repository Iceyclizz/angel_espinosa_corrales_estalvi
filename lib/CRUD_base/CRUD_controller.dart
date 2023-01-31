import 'package:flutter/material.dart';

import '../costmodel.dart';
import '../modelo.dart';
import 'CRUD_model_base.dart';

class CRUDControllerBase<T extends Item> {

  CRUDControllerBase();

  final Modelo elModel=Modelo();

  void addItem(T elItem) {
    elModel.add(elItem);
  }

  void updateItem(T originalItem) {
    elModel.updateItem(originalItem);
  }
void deleteItem(T originalItem) {
    elModel.updateItem(originalItem);
  }
  List<T> getAllItems() {
    return elModel.getAll();
  }
  List<int> getIDs<T>() {
    return elModel.getIDs<T>();
  }
  Future<void> initapp() async {
    WidgetsFlutterBinding.ensureInitialized();
    elModel.initapp();
  }
  double getahorros(){
    return elModel.getahorros();
  }
}