import 'package:flutter/material.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/Models/category.dart';
import 'package:prj/Screens/HomeScreen/HelpingWIdgets(BottomPart)/CatList.dart';
import 'package:prj/Screens/HomeScreen/HelpingWIdgets(BottomPart)/GridView.dart';
import 'package:prj/Screens/HomeScreen/HelpingWidgets%20(UpperPart)/OfferCard.dart';
import 'package:prj/Screens/HomeScreen/HelpingWidgets%20(UpperPart)/searchBar.dart';
import 'package:prj/Screens/HomeScreen/HelpingWidgets%20(UpperPart)/background_layout.dart';
import 'package:prj/Screens/HomeScreen/HelpingWidgets%20(UpperPart)/locationDropDown.dart';
import 'package:prj/Screens/HomeScreen/HelpingWidgets%20(UpperPart)/profileAvatar.dart';

// This is the screen of home, not the tabs.dart
// Here we will put the chosen category variable, not the chosen screen
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Homescreen> {
  category cat = categories[0];
  List<Coffee> selectedCoffees = coffees;

  void rebuild(category newCat) {
    setState(() {
      cat = newCat;
      // get all the coffee items that are in the selected category
      if (newCat.id == "all") {
        selectedCoffees = coffees;
      } else {
        selectedCoffees =
            coffees
                .where(
                  (element) => element.categoryIDs.any((id) => id == cat.id),
                )
                .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundLayout(),
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [LocationDropdown(), Spacer(), ProfileAvatar()],
              ),
              const SizedBox(height: 20),

              const searchBar(),

              const SizedBox(height: 30),

              const Offercard(),

              const SizedBox(height: 20),

              Catlist(cat: cat, rebuild: rebuild),

              const SizedBox(height: 20),

              Gridview(selectedCoffees: selectedCoffees),
            ],
          ),
        ),
      ],
    );
  }
}
