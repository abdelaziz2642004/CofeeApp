import 'package:uuid/uuid.dart';

class Coffee {
  final String _id;
  final String _name;
  final String _description;
  double _rating;
  final double _smallPrice;
  final double _mediumPrice;
  final double _largePrice;

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
    required double smallPrice,
    required double mediumPrice,
    required double largePrice,

    required String imageUrl,
    required List<String> categoryIDs,
    required double rating,
  }) : _name = name,
       _description = description,
       _smallPrice = smallPrice,
       _mediumPrice = mediumPrice,
       _largePrice = largePrice,

       _imageUrl = imageUrl,
       _categoryIDs = categoryIDs,
       _rating = rating,
       _id = Uuid().v4();

  String get id => _id;

  String get name => _name;

  String get description => _description;

  double get rating => _rating;

  double getPrice(String size) {
    // print(size);
    // print("$_smallPrice, $_mediumPrice, $_largePrice");
    return size == 'L'
        ? _largePrice
        : size == 'M'
        ? _mediumPrice
        : _smallPrice;
  }

  String get imageUrl => _imageUrl;

  List<String> get categoryIDs => _categoryIDs;

  int get ratingCount => _ratingCount;

  bool get isSugary => _isSugary;

  bool get isDairy => _isDairy;

  bool get containsNuts => _containsNuts;

  bool get containsCaffeine => _containsCaffeine;

  bool get isDecaf => _isDecaf;
}
