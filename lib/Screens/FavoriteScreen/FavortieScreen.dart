import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Providers/drinksProvider.dart';
import 'package:prj/Screens/FavoriteScreen/HelpingWidgets/favoriteItem.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
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
    final drinksAsync = ref.watch(drinksProvider);

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
      body: drinksAsync.when(
        data: (drinks) {
          final favoriteCoffees =
              drinks
                  .where((coffee) => currentUser.favorited.contains(coffee.id))
                  .toList();

          return favoriteCoffees.isEmpty
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
              );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (error, stack) => Center(
              child: Text(
                "Error: $error",
                style: const TextStyle(color: Colors.red),
              ),
            ),
      ),
    );
  }
}
