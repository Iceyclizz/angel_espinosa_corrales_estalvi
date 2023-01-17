
import 'package:crud_framework/widgets_lib/app_base.dart';
import 'package:flutter/material.dart';

void main() {
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

      },
      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
        }
        return null;
      },
      home: const MyHomePage(title: 'CRUD Template'),
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
    return const BaseApp(body: Text("CRUD Template"));
  }
}
