import 'package:flutter/material.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Screens/FavoriteScreen/HelpingWidgets/favoriteItem.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  String emptyMessage = "Start Favoriting Some meals !";

  void toggleFavorite(String coffeeId) {
    setState(() {
      if (currentUser.favorited.contains(coffeeId)) {
        currentUser.favorited.remove(coffeeId);
      } else {
        currentUser.favorited.add(coffeeId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Coffee> favoriteCoffees =
        coffees
            .where((coffee) => currentUser.favorited.contains(coffee.id))
            .toList();

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'DopisBold',
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body:
          favoriteCoffees.isEmpty
              ? Center(
                child: Text(
                  emptyMessage,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'DopisBold',
                    color: Colors.black,
                  ),
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: favoriteCoffees.length,
                itemBuilder: (context, index) {
                  return FavoriteItem(
                    coffee: favoriteCoffees[index],
                    onToggleFavorite: toggleFavorite,
                  );
                },
              ),
    );
  }
}
