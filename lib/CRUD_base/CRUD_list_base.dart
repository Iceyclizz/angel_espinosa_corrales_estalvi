import 'CRUD_controller.dart';
import 'package:flutter/material.dart';
import 'CRUD_model_base.dart';

class CRUDListBase<T extends Item> extends StatefulWidget {
  CRUDListBase({Key? key, required this.itemBuilder, required this.addItemRoute, required this.viewItemRoute}) : super(key: key);

  final CRUDControllerBase<T> _elController = CRUDControllerBase();
  final Widget Function(T) itemBuilder;
  final String addItemRoute;
  final String viewItemRoute;

  @override
  State<CRUDListBase<T>> createState() => _CRUDListBaseState();
}

class _CRUDListBaseState<T extends Item> extends State<CRUDListBase<T>> {
  @override
  Widget build(BuildContext context) {

    List<Widget> items=[
      for (T item in widget._elController.getAllItems())
        TextButton(onPressed: () async {
          await Navigator.of(context).pushNamed(widget.viewItemRoute,arguments: item);
          setState(() {

          });
        },
            child: widget.itemBuilder(item))
    ];

    return Scaffold(
      body: items.isEmpty?
          const Center(child: Text("No hi ha dades"),)
          : ListView(
        children: items,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed(widget.addItemRoute);
          setState(() {

          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
