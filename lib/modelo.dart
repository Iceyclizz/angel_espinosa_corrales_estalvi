import 'CRUD_base/CRUD_model_base.dart';


class Modelo {
  static final Modelo _modelo = Modelo._internal();

  factory Modelo() {
    return _modelo;
  }

  Modelo._internal();

  void add<T>(T item) {
    switch (T) {
      default:
        throw UnimplementedError("Type ${T.toString()} not supported.");
    }
  }

  void delete<T>(T item) {
    switch (T) {
      default:
        throw UnimplementedError("Type ${T.toString()} not supported.");
    }
  }

  void updateItem<T>(T originalItem, T updatedItem) {
    delete(originalItem);
    add(updatedItem);
  }

  List<T> getAll<T>() {
    switch (T) {
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
}
