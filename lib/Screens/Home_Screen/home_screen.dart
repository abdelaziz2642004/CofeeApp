import 'package:flutter/material.dart';
import 'package:prj/Screens/Home_Screen/HelpingWidgets%20(UpperPart)/CoffeeCard.dart';
import 'package:prj/Screens/Home_Screen/HelpingWidgets%20(UpperPart)/searchBar.dart';
import 'package:prj/Screens/Home_Screen/HelpingWidgets%20(UpperPart)/background_layout.dart';
import 'package:prj/Screens/Home_Screen/HelpingWidgets%20(UpperPart)/locationDropDown.dart';
import 'package:prj/Screens/Home_Screen/HelpingWidgets%20(UpperPart)/profileAvatar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const BackgroundLayout(),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      LocationDropdown(),
                      Spacer(),
                      ProfileAvatar(),
                    ],
                  ),
                  SizedBox(height: 20),
                  searchBar(),
                  SizedBox(height: 30),

                  // turn this into a stack with promo and other texts
                  Coffeecard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
