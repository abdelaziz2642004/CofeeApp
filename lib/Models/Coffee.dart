import 'package:uuid/uuid.dart';

class Coffee {
  final String _id;
  String _name;
  String _description;
  double _rating;
  double _price;
  String _imageUrl;
  List<String> _categoryIDs;
  int _ratingCount = 89;

  final bool _isSugary = true;
  final bool _isDairy = true; // done
  final bool _isDecaf = true;
  final bool _containsNuts = true;
  final bool _containsCaffeine = true;

  Coffee({
    required String name,
    required String description,
    required double price,
    required String imageUrl,
    required List<String> categoryIDs,
    required double rating,
  }) : _name = name,
       _description = description,
       _price = price,
       _imageUrl = imageUrl,
       _categoryIDs = categoryIDs,
       _rating = rating,
       _id = Uuid().v4();

  String get id => _id;

  String get name => _name;
  set name(String value) => _name = value;

  String get description => _description;
  set description(String value) => _description = value;

  double get rating => _rating;

  double get price => _price;

  String get imageUrl => _imageUrl;

  List<String> get categoryIDs => _categoryIDs;

  int get ratingCount => _ratingCount;

  bool get isSugary => _isSugary;

  bool get isDairy => _isDairy;

  bool get containsNuts => _containsNuts;

  bool get containsCaffeine => _containsCaffeine;

  bool get isDecaf => _isDecaf;
}
