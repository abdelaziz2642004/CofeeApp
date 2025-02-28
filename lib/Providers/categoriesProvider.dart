import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prj/Models/category.dart';

class categoriesProviderr extends StateNotifier<List<category>> {
  categoriesProviderr(this.ref) : super([]) {
    fetchDrinks();
  }

  final Ref ref;

  Future<void> fetchDrinks() async {
    try {
      final firestore = FirebaseFirestore.instance.collection('Categories');
      final tmp = await firestore.get();
      List<category> fetchedCats = [];

      for (var cat in tmp.docs) {
        final catData = cat.data();

        final category c = category(
          id: catData['id'] ?? '', // Firestore document ID
          name: catData['name'] ?? '',
        );

        fetchedCats.add(c);
      }

      state = fetchedCats;
    } catch (e) {
      print('Error fetching drinks: $e');
    }
  }

  Future<void> empty() async {
    state = [];
    await fetchDrinks();
  }
}

final categoriesProvider =
    StateNotifierProvider<categoriesProviderr, List<category>>((ref) {
      return categoriesProviderr(ref);
    });
