import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/Models/category.dart';
import 'package:prj/Providers/categoriesProvider.dart';
import 'package:prj/Providers/drinksProvider.dart';
import 'package:prj/Screens/LoginScreen/LoginScreen.dart';
import 'package:prj/Screens/Tabs%20(%20Screen%20Chooser%20)/tabs.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // most important 2 lines for firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // most important 2 lines for firebase

  // start();

  // await FirebaseFirestore.instance
  //     .collection('test')
  //     .doc("OV26juxm1CQKxe42P58v")
  //     .update({'hello': "Value changed , DB WORKS!!!!!"});
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  Widget Screen = Container();
  @override
  void initState() {
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
    List<Coffee> allDrinks = ref.watch(drinksProvider);
    List<category> allCats = ref.watch(categoriesProvider);

    coffees = allDrinks;
    categories = allCats;
    for (var c in categories) {
      categoryMap[c.id] = c.name;
    }
    return MaterialApp(home: Screen);
  }
}
