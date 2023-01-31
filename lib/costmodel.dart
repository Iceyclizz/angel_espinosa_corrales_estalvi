import 'package:crud_framework/CRUD_base/CRUD_model_base.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'costmodel.g.dart';
@HiveType(typeId: 2)
enum Categoria {
  @HiveField(0)
  festa,
  @HiveField(1)
  viatge,
  @HiveField(2)
  nomina,
  @HiveField(3)
  capritxo,
  @HiveField(4)
  regal
}

@HiveType(typeId: 3)
enum TipusCost {
  @HiveField(0)
  recurrent,
  @HiveField(1)
  extraordinari
}

class Cost extends Item<int>{
  DateTime data;
  Categoria categoria;
  TipusCost tipo;
  String concepte;
  double quantitat;
Cost(super.key, this.data, this.categoria, this.tipo, this.concepte,
      this.quantitat);
  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': super.key,
      'data': data,
      'categoria': categoria,
      'tipo': tipo,
      'concepte': concepte,
      'quantitat': quantitat
    };
  }

  static List<String> listacategoria() {
    List<String> categorias = [];
    for (Categoria c in Categoria.values) {
      categorias.add(c.name.toUpperCase());
    }
    return categorias;
  }

  static Categoria? getcategoria(String cat) {
    for (Categoria c in Categoria.values) {
      if (c.name.toUpperCase() == cat) {
        return c;
      }
    }
  }

  static List<String> listatipuscost() {
    List<String> tipuscosts = [];
    for (TipusCost t in TipusCost.values) {
      tipuscosts.add(t.name.toUpperCase());
    }
    return tipuscosts;
  }

  static TipusCost? gettipuscost(String tipus) {
    for (TipusCost t in TipusCost.values) {
      if (t.name.toUpperCase() == tipus) {
        return t;
      }
    }
  }
}

class TempCost {
  TempCost(
      {this.data, this.categoria, this.tipo, this.concepte, this.quantitat});
  DateTime? data;
  Categoria? categoria;
  TipusCost? tipo;
  String? concepte;
  double? quantitat;
}

class CostModel implements CRUDModelBase<int, Cost> {
  final Map<int, Cost> _datos = {};
  @override
  void addItem(Cost elItem) {
    _datos[elItem.key] = elItem;
    synchive();
  }

  @override
  Map<int, Cost> get datos => _datos;

  @override
  void updateItem(Cost item) {
    _datos[item.key] = item;
    synchive();
  }

  @override
  void deleteItem(Cost elItem) {
    _datos.remove(elItem.key);
    synchive();
  }
  void synchive() {
     Box pocketbox = Hive.box('costapp');
    pocketbox.put('costs', datos.values.toList());
  }
  double calcahorros(){
    double ahorro=0;
    for (Cost c in datos.values.toList()) {
      ahorro+=c.quantitat;
    }
    return ahorro;
  }
}
