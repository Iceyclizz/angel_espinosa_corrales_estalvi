
abstract class Item<T> {

  const Item(this._key);

  final T _key;

  T get key => _key;

  Map<String,dynamic> toMap();
}

class CRUDModelBase<T,S extends Item<T>> {

  static final CRUDModelBase _elModelo=CRUDModelBase._internal();

  factory CRUDModelBase() {
    return _elModelo as CRUDModelBase<T,S>;
  }

  CRUDModelBase._internal();

  final Map<T,S> datos={};

  void addItem(S elItem) {
    T key=elItem.key;
    if (datos.containsKey(key)) {
      throw ArgumentError("Ja existeix un item amb la clau $key");
    }
    datos[key]=elItem;

  }
    void deleteItem(S elItem) {
    T key=elItem.key;
    if (datos.containsKey(key)) {
      datos.remove(key);
    }
    throw ArgumentError("No existeix un item amb la clau $key");
  }
  void updateItem(S item) {
    T key=item.key;
    if (datos.containsKey(key)) {
      datos[key]==item;
    } else {
      throw ArgumentError("No existeix cap item amb la clau $key");
    }
  }
}