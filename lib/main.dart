
import 'package:crud_framework/CRUD_base/CRUD_controller.dart';
import 'package:crud_framework/CRUD_base/CRUD_list_base.dart';
import 'package:crud_framework/CRUD_base/CRUD_view_base.dart';
import 'package:crud_framework/costmodel.dart';
import 'package:crud_framework/widgets_lib/app_base.dart';
import 'package:flutter/material.dart';
import 'costbuild.dart';
void main() async {
  await CRUDControllerBase().initapp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'CRUD Template',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/costlist': (context) => CRUDListBase<Cost>(itemBuilder: CostWidgets().lista, addItemRoute: '/costadd', viewItemRoute: '/costview'),
        '/costadd': (context) => CRUDViewBase<Cost>(detailedView: CostWidgets().vista,editFormView: CostForm()),
      },
      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
          case '/costview':
          return MaterialPageRoute(builder: (context) => CRUDViewBase(detailedView: CostWidgets().vista, editFormView: CostForm(cost: routeSettings.arguments as Cost),item: routeSettings.arguments as Cost,));
        }
        return null;
      },
      home: const MyHomePage(title: 'Ahorro'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BaseApp(body: Container(color: CRUDControllerBase().getahorros()>=0?Colors.green:Colors.red,child: Center(child: Text(CRUDControllerBase().getahorros().toString()),)),);
  }
}
