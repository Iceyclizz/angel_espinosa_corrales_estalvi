import 'package:crud_framework/CRUD_base/CRUD_view_base.dart';
import 'package:flutter/material.dart';
import 'CRUD_base/CRUD_controller.dart';
import 'costmodel.dart';

class CostWidgets {
  Widget lista(Item) => ListTile(
        title: Card(child: Text((Item as Cost).concepte)),
        subtitle: Row(children: [Container(child: Text('${Item.data.toString()}\t\t'),),Container(color: Item.quantitat>=0?Colors.green:Colors.red,child: Text('${Item.quantitat.toString()}€'),)],)
      );
  Widget vista(Item) => Card(child: Column(
        children: [
          Text(Item.concepte),
          Text(Item.quantitat.toString()),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(child: Text((Item.categoria as Categoria).name.toUpperCase())),
              ),
              Expanded(
                flex: 1,
                child: Center(child: Text((Item.tipo as TipusCost).name.toUpperCase())),
              )
            ],
          ),
          Text(Item.data.toString())
        ],
      ),)
  ;
}

class CostForm extends CRUDFormulari<Cost> {
  CostForm({super.key, this.cost});
  CRUDControllerBase<Cost> controllerBase = CRUDControllerBase<Cost>();
  final Cost? cost;
  TempCost? tempcost;
  @override
  State<StatefulWidget> createState() => CostFormState();

  @override
  Cost? getItem() {
    if (cost != null) {
      return Cost(cost!.key,tempcost!.data!,tempcost!.categoria!,tempcost!.tipo!,tempcost!.concepte!,tempcost!.quantitat!);
    } else {
      return Cost(controllerBase.getIDs<Cost>().length,tempcost!.data!,tempcost!.categoria!,tempcost!.tipo!,tempcost!.concepte!,tempcost!.quantitat!);
    }
  }
}

class CostFormState extends State<CostForm> {
  String dropdownValue1 = Categoria.values.first.name.toUpperCase();
  String dropdownValue2 = TipusCost.values.first.name.toUpperCase();
  @override
  void initState() {
    setState(() {
      if (widget.cost == null) {
        widget.tempcost = TempCost();
      } else {
        widget.tempcost = TempCost(
            concepte: widget.cost!.concepte,
            categoria: widget.cost!.categoria,
            data: widget.cost!.data,
            quantitat: widget.cost!.quantitat,
            tipo: widget.cost!.tipo
            );
            dropdownValue1=widget.cost!.categoria.name.toUpperCase();
            dropdownValue2=widget.cost!.tipo.name.toUpperCase();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          initialValue: widget.tempcost!.concepte ?? '',
          decoration: const InputDecoration(
                label: Text("Concepte"),
              ),
          validator: (value) {
            if (value == null || value == '') {
              return 'Rellena el campo';
            }
          },
          onSaved: (newValue) => widget.tempcost!.concepte = newValue!,
        ),
        TextFormField(
          initialValue: widget.tempcost!.quantitat.toString()=='null'?'':widget.tempcost!.quantitat.toString(),
              decoration: const InputDecoration(
                label: Text("Import"),
              ),
              keyboardType: TextInputType.number,
              validator: (valor) {
                if (double.tryParse(valor ?? "") == null) {
                  return "Inserta un numero";
                }
              },
              onSaved: (valor) =>
                  widget.tempcost!.quantitat=double.parse(valor!),
            ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: FormField<Categoria>(
                        initialValue: Categoria.values.first,
                        builder: (formFieldState) {
                          return DropdownButton<String>(
                            value: dropdownValue1,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: const TextStyle(color: Colors.blue),
                            underline: Container(
                              height: 2,
                              color: Colors.blueAccent,
                            ),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                dropdownValue1 = value!;
                                formFieldState.didChange(Cost.getcategoria(value));
                              });
                            },
                            items: Cost.listacategoria()
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }).toList(),
                          );
                        },
                        validator: (value) {
                          if (value == null) {
                            return "Se debe seleccionar una categoria";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (newValue) =>
                            widget.tempcost!.categoria = newValue,
                      ),
            ),
            Expanded(
              flex: 1,
              child: FormField<TipusCost>(
                        initialValue: TipusCost.values.first,
                        builder: (formFieldState) {
                          return DropdownButton<String>(
                            value: dropdownValue2,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: const TextStyle(color: Colors.blue),
                            underline: Container(
                              height: 2,
                              color: Colors.blueAccent,
                            ),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                dropdownValue2 = value!;
                                formFieldState.didChange(Cost.gettipuscost(value));
                              });
                            },
                            items: Cost.listatipuscost()
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }).toList(),
                          );
                        },
                        validator: (value) {
                          if (value == null) {
                            return "Se debe seleccionar una categoria";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (newValue) =>
                            widget.tempcost!.tipo = newValue,
                      ),
            )
          ],
        ),
        FormField<DateTime>(
                    onSaved: (valor) => widget.tempcost!.data = valor,
                    initialValue: widget.tempcost!.data,
                    builder: (formFieldState) {
                      return TextButton(
                          onPressed: () async {
                            DateTime? fecha = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900, 1, 1),
                                lastDate: DateTime(2200, 12, 31));
                            if (fecha != null) {
                              formFieldState.didChange(fecha);
                              TimeOfDay? hora = await showTimePicker(
                                  context: context,
                                  initialTime:
                                      const TimeOfDay(hour: 0, minute: 0));
                              if (hora != null) {
                                formFieldState.didChange(DateTime(
                                    fecha.year,
                                    fecha.month,
                                    fecha.day,
                                    hora.hour,
                                    hora.minute));
                              }
                            }
                          },
                          child: Text(formFieldState.value == null
                              ? "Prem per definir"
                              : formFieldState.value.toString()));
                    },
                  )
      ],
    );
  }
}
