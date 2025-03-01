import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/Models/category.dart';
import 'package:prj/Providers/categoriesProvider.dart';
import 'package:prj/Providers/drinksProvider.dart';

import 'package:prj/Screens/HomeScreen/HelpingWIdgets(BottomPart)/CatList.dart';
import 'package:prj/Screens/HomeScreen/HelpingWIdgets(BottomPart)/GridView.dart';
import 'package:prj/Screens/HomeScreen/HelpingWidgets%20(UpperPart)/OfferCard.dart';
import 'package:prj/Screens/HomeScreen/HelpingWidgets%20(UpperPart)/filterMenu.dart';
import 'package:prj/Screens/HomeScreen/HelpingWidgets%20(UpperPart)/searchBar.dart';
import 'package:prj/Screens/HomeScreen/HelpingWidgets%20(UpperPart)/background_layout.dart';
import 'package:prj/Screens/HomeScreen/HelpingWidgets%20(UpperPart)/locationDropDown.dart';
import 'package:prj/Screens/HomeScreen/HelpingWidgets%20(UpperPart)/profileAvatar.dart';

// This is the screen of home, not the tabs.dart
// Here we will put the chosen category variable, not the chosen screen
class Homescreen extends ConsumerStatefulWidget {
  const Homescreen({super.key});

  @override
  ConsumerState<Homescreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<Homescreen> {
  category cat = category(name: 'All Coffee', id: 'all');

  List<Coffee> selectedCoffees = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedCoffees = ref.read(drinksProvider).value ?? [];
  }

  void rebuild(category newCat) {
    final drinksAsync = ref.read(drinksProvider);

    setState(() {
      cat = newCat;
      if (newCat.id == "all") {
        selectedCoffees = drinksAsync.value ?? [];
      } else {
        selectedCoffees =
            drinksAsync.value
                ?.where((coffee) => coffee.categoryIDs.contains(cat.id))
                .toList() ??
            [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final drinksAsync = ref.watch(drinksProvider);

    return Stack(
      children: [
        const BackgroundLayout(),
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: drinksAsync.when(
            data:
                (coffees) => Column(
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
                    Row(children: [Expanded(child: searchBar()), FilterMenu()]),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        // Go to notifications screen
                      },
                      child: const Offercard(),
                    ),
                    const SizedBox(height: 20),
                    Catlist(cat: cat, rebuild: rebuild),
                    const SizedBox(height: 20),
                    Gridview(selectedCoffees: selectedCoffees),
                  ],
                ),
            loading:
                () => Center(child: Lottie.asset('assets/JSON/loading.json')),
            error: (error, stack) => Center(child: Text("Error: $error")),
          ),
        ),
      ],
    );
  }
}
