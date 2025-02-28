import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prj/Models/Coffee.dart';

class drinksProviderr extends StateNotifier<List<Coffee>> {
  drinksProviderr(this.ref) : super([]) {
    fetchDrinks();
  }

  final Ref ref;

  Future<void> fetchDrinks() async {
    try {
      final firestore = FirebaseFirestore.instance.collection('Drinks');
      final tmp = await firestore.get();
      List<Coffee> fetchedDrinks = [];

      for (var drinkDoc in tmp.docs) {
        final drinkData = drinkDoc.data();

        final Coffee c = Coffee(
          id: drinkDoc.id, // Firestore document ID
          name: drinkData['name'] ?? '',
          description: drinkData['description'] ?? '',
          smallPrice: (drinkData['smallPrice'] ?? 0).toDouble(),
          mediumPrice: (drinkData['mediumPrice'] ?? 0).toDouble(),
          largePrice: (drinkData['largePrice'] ?? 0).toDouble(),
          imageUrl: drinkData['imageUrl'] ?? '',
          categoryIDs: List<String>.from(drinkData['categoryIDs'] ?? []),
          rating: (drinkData['rating'] ?? 0).toDouble(),
          ratingCount: drinkData['ratingCount'] ?? 0,
          isSugary: drinkData['isSugary'] ?? true,
          isDairy: drinkData['isDairy'] ?? true,
          isDecaf: drinkData['isDecaf'] ?? false,
          containsNuts: drinkData['containsNuts'] ?? false,
          containsCaffeine: drinkData['containsCaffeine'] ?? true,
        );

        fetchedDrinks.add(c);
      }

      state = fetchedDrinks;
    } catch (e) {
      print('Error fetching drinks: $e');
    }
  }

  Future<void> empty() async {
    state = [];
    await fetchDrinks();
  }
}

final drinksProvider = StateNotifierProvider<drinksProviderr, List<Coffee>>((
  ref,
) {
  return drinksProviderr(ref);
});
