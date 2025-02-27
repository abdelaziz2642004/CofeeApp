import 'package:flutter/material.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Screens/LoginScreen/LoginScreen.dart';
import 'package:prj/Screens/Tabs%20(%20Screen%20Chooser%20)/tabs.dart';

void main() {
  start();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget Screen = Container();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Screen = Loginscreen(guestMode: guestMode);
  }

  void guestMode() {
    setState(() {
      Screen = TabsScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Screen);
  }
}
