import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prj/Models/category.dart';

final categoriesProvider = FutureProvider<List<category>>((ref) async {
  try {
    final firestore = FirebaseFirestore.instance.collection('Categories');
    final querySnapshot = await firestore.get();

    return querySnapshot.docs.map((doc) {
      final data = doc.data();
      return category(id: data['id'] ?? '', name: data['name'] ?? '');
    }).toList();
  } catch (e) {
    print('Error fetching categories: $e');
    return [];
  }
});
