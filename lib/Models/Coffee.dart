import 'package:uuid/uuid.dart';

final Uuid uuid = Uuid();

class Coffee {
  final String _id;
  final String name;
  final String description;
  final double rating;
  final double price;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> categoryIDs;

  Coffee({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.ingredients,
    required this.categoryIDs,
    required this.rating,
  }) : _id = uuid.v4();

  String get id => _id;
}
