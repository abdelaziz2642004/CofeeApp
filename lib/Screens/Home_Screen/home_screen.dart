import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/Models/category.dart';
import 'package:prj/Screens/Home_Screen/HelpingWIdgets(BottomPart)/CatList.dart';
import 'package:prj/Screens/Home_Screen/HelpingWIdgets(BottomPart)/GridView.dart';
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
  category cat = categories[0];
  List<Coffee> selectedCoffees = coffees;

  void rebuild(category newCat) {
    setState(() {
      cat = newCat;
      // get all the coffee items that are in the selected category
      selectedCoffees =
          coffees
              .where((element) => element.categoryIDs.any((id) => id == cat.id))
              .toList();
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

                  const SizedBox(height: 20),

                  Catlist(cat: cat, rebuild: rebuild),

                  const SizedBox(height: 20),

                  Gridview(selectedCoffees: selectedCoffees),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
