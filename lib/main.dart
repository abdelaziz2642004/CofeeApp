import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Models/User.dart';
import 'package:prj/Models/WishList.dart';
import 'package:prj/Providers/userProvider.dart';
import 'package:prj/Screens/LoginScreen/LoginScreen.dart';
import 'package:prj/Screens/Tabs%20(%20Screen%20Chooser%20)/tabs.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // most important 2 lines for firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // most important 2 lines for firebase

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
    // ref.read(drinksProvider.notifier).fetchDrinks();

    // ref.read(categoriesProvider.notifier).fetchCats();
  }

  void guestMode() {
    setState(() {
      Screen = TabsScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Lottie.asset('assets/JSON/loading.json'));
            }
            if (snapshot.hasData) {
              final userAsync = ref.watch(userProvider);
              currentUser =
                  userAsync.value ??
                  user(
                    id: "",
                    email: "",
                    wishlist: Wishlist(items: [], total: 0),
                    ImageUrl: '',
                    fullName: 'fullName',
                    favorited: [],
                    notifications: [],
                  );
              //f logged in , fetch the goddamn user !! :d

              return TabsScreen();
            }
            return (snapshot.hasData)
                ? TabsScreen() // logged in ?
                : Screen; // not logged in ? login Screen , then if guest , screen will change to tabs automatically :D
          },
        ),
      ),
    );
  }
}
