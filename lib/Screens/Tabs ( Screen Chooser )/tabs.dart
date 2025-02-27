import 'package:flutter/material.dart';
import 'package:prj/Screens/HomeScreen/HomeScreen.dart';
import 'package:prj/Screens/LoginScreen/LoginScreen.dart';
import 'package:prj/Screens/Tabs%20(%20Screen%20Chooser%20)/BottomNavBar.dart';
import 'package:prj/Screens/WishListScreen/WishlistScreen.dart';

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

  Widget _buildScreenChooser(int index, void Function(int) rebuild) {
    switch (index) {
      case 0:
        return Homescreen();

      case 2:
        return wishlistscreen();
      default:
        return Homescreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildScreen = _buildScreenChooser(_index, rebuild);
    return SafeArea(
      child: Scaffold(
        body: _buildScreen,
        bottomNavigationBar: Bottomnavbar(index: _index, rebuild: rebuild),
      ),
    );
  }
}
