import '../modelo.dart';
import 'CRUD_model_base.dart';

class CRUDControllerBase<T extends Item> {

  CRUDControllerBase();

  final Modelo elModel=Modelo();

  void addItem(T elItem) {
    elModel.add(elItem);
  }

  void updateItem(T originalItem, T updatedItem) {
    elModel.updateItem(originalItem, updatedItem);
  }

  List<T> getAllItems() {
    return elModel.getAll();
  }
}