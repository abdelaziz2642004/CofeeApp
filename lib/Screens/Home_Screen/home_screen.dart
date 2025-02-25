import 'package:flutter/material.dart';
import 'package:prj/Screens/Home_Screen/HelpingWIdgets(BottomPart)/CatList.dart';
import 'package:prj/Screens/Home_Screen/HelpingWIdgets(BottomPart)/CoffeeItem.dart';

import 'package:prj/Screens/Home_Screen/HelpingWidgets%20(UpperPart)/OfferCard.dart';
import 'package:prj/Screens/Home_Screen/HelpingWidgets%20(UpperPart)/searchBar.dart';
import 'package:prj/Screens/Home_Screen/HelpingWidgets%20(UpperPart)/background_layout.dart';
import 'package:prj/Screens/Home_Screen/HelpingWidgets%20(UpperPart)/locationDropDown.dart';
import 'package:prj/Screens/Home_Screen/HelpingWidgets%20(UpperPart)/profileAvatar.dart';

// This is the screen of home, not the tabs.dart
// Here we will put the chosen category variable, not the chosen screen
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                  const SizedBox(height: 20),
                  const searchBar(),
                  const SizedBox(height: 30),
                  const Coffeecard(),
                  SizedBox(height: 20),

                  Catlist(index: _index, rebuild: rebuild),
                  SizedBox(height: 20),

                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            2, // How many elements next to each other in one row
                        crossAxisSpacing: 25,
                        mainAxisSpacing: 25,
                        childAspectRatio:
                            0.67, // Adjust this value based on the desired height/width ratio
                      ),
                      itemCount: 20, // Number of cards
                      itemBuilder: (context, index) {
                        return CoffeeItem(
                          name: "Caffe Mocha",
                          cat: "Deep Foam",
                          price: 4.53,
                          rating: 2.5,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
