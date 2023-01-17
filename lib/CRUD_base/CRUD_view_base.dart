import 'CRUD_controller.dart';
import 'package:flutter/material.dart';

import 'CRUD_model_base.dart';

enum CRUDViewMode { add, view, edit, delete }

abstract class CRUDFormulari<T extends Item> extends StatefulWidget  {
  const CRUDFormulari({super.key});

  T? getItem();
}

class CRUDViewBase<T extends Item> extends StatefulWidget {
  CRUDViewBase(
      {Key? key, required this.detailedView, required this.editFormView, this.title = "Gestió", this.item})
      : super(key: key);

  final CRUDControllerBase<T> _elController = CRUDControllerBase();
  final T? item;
  final Widget Function(T item) detailedView;
  final CRUDFormulari<T> editFormView;
  final String title;

  @override
  State<CRUDViewBase> createState() => _CRUDViewBaseState();
}

class _CRUDViewBaseState extends State<CRUDViewBase> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  late CRUDViewMode mode;

  @override
  void initState() {
    mode = widget.item == null ? CRUDViewMode.add : CRUDViewMode.view;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    IconData buttonIcon=Icons.save;

    switch (mode){
      case CRUDViewMode.add:
        buttonIcon=Icons.save;
        break;
      case CRUDViewMode.edit:
        buttonIcon=Icons.save;
        break;
      case CRUDViewMode.view:
        buttonIcon=Icons.edit;
        break;
      case CRUDViewMode.delete:
        buttonIcon=Icons.delete;
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: getView(mode),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: DateTime.now(),
        onPressed: () {
          if (mode == CRUDViewMode.add || mode == CRUDViewMode.edit) {
            if (_formKey.currentState != null) {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                var elItem = widget.editFormView.getItem();
                if (elItem != null) {
                  if (mode == CRUDViewMode.add) {
                    widget._elController.addItem(elItem);
                  } else {
                    widget._elController.updateItem(widget.item!,elItem);
                  }
                  Navigator.of(context).pop(elItem);
                }
              }
            }
          } else if (mode==CRUDViewMode.view) {
            mode=CRUDViewMode.edit;
            setState(() {

            });
          }
        },
        child: Icon(buttonIcon),
      ),
    );
  }

  Widget getView(CRUDViewMode mode) {
    switch (mode) {
      case CRUDViewMode.add:
      case CRUDViewMode.edit:
        return Form(key: _formKey, child: widget.editFormView);
      case CRUDViewMode.view:
        return widget.detailedView(widget.item!);
      default:
        throw UnimplementedError("Mode $mode not implemented.");
    }
  }
}
