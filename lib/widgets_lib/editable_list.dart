import 'package:flutter/material.dart';
import '../CRUD_base/CRUD_view_base.dart';

class EditableList<T> extends StatefulWidget {
  const EditableList(
      {Key? key,
      required this.lista,
      required this.builder,
      required this.itemFormulari})
      : super(key: key);

  final List<T> lista;
  final Widget Function(T item) builder;
  final CRUDFormulari Function(T? item) itemFormulari;

  @override
  State<EditableList> createState() => _EditableListState<T>();
}

class _EditableListState<T> extends State<EditableList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (T item in widget.lista)
          Row(
            children: [
              Expanded(
                  child: TextButton(
                      onPressed: () {}, child: widget.builder(item))),
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
            ],
          ),
        TextButton(
            onPressed: () async {
              T? resultado = await showDialog(
                  context: context,
                  builder: (buildContext) {

                    final GlobalKey<FormState> form=GlobalKey();
                    final CRUDFormulari elFormulari=widget.itemFormulari(null);

                    return Dialog(
                      child: Column(
                        children: [
                          Expanded(child: Form(key:form, child: elFormulari)),
                          Row(children:  [
                            const Expanded(child: Center()),
                            FloatingActionButton(onPressed: ( ) {
                              if (form.currentState!=null && form.currentState!.validate()) {
                                form.currentState!.save();
                                Navigator.of(context).pop(elFormulari.getItem());
                              }
                            },
                            child: const Icon(Icons.save)),
                        ],
                      ),
                    ]));
                  });
              if (resultado!=null) {
                widget.lista.add(resultado);
                setState(() {

                });
              }
            },
            child: const Text("Añadir..."))
      ],
    );
  }
}
