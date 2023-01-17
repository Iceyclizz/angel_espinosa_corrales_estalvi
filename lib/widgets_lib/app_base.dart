import 'package:flutter/material.dart';

class BaseApp extends StatelessWidget {
  const BaseApp(
      {Key? key,
      this.title = "CRUD Template",
      required this.body,
      this.actionButton})
      : super(key: key);

  final String title;
  final Widget body;
  final Widget? actionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      floatingActionButton: actionButton,
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Text("Menú general"),
            ),
            //Container(padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),color: Colors.lightBlueAccent,child: const Text("Evaluación",)),
            ListTile(
              title: const Text("Menú item 1"),
              onTap: () => Navigator.of(context).pushNamed("/"),
            ),
           ],
        ),
      ),
    );
  }
}
