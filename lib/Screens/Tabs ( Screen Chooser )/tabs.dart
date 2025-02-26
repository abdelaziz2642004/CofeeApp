import 'package:flutter/material.dart';
import 'package:prj/Screens/HomeScreen/HomeScreen.dart';
import 'package:prj/Screens/Tabs%20(%20Screen%20Chooser%20)/BottomNavBar.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key});

  @override
  State<TabsScreen> createState() => _TabsState();
}

class _TabsState extends State<TabsScreen> {
  int _index = 0;

  void rebuild(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Homescreen(),
        bottomNavigationBar: Bottomnavbar(index: _index, rebuild: rebuild),
      ),
    );
  }
}
