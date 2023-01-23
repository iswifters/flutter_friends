
import 'package:flutter/material.dart';

class MyFlutterListe extends StatefulWidget {
  const MyFlutterListe({Key? key}) : super(key: key);

  @override
  State<MyFlutterListe> createState() => _MyFlutterListeState();
}

class _MyFlutterListeState extends State<MyFlutterListe> {
  List<String> friendz = [
    "Muna",
    "Diana",
    "Lura"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Friends List"),
          centerTitle: true,
        ),
        body: Column(

            children: friendz.map((foodItemParameter) {
              return Text(foodItemParameter);
            }).toList()

        ));
  }
}
