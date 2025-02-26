import 'package:flutter/material.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Screens/Tabs%20(%20Screen%20Chooser%20)/tabs.dart';

void main() {
  start();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TabsScreen());
  }
}
