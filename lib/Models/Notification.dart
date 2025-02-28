import 'package:prj/Models/Coffee.dart';
import 'package:uuid/uuid.dart';

class notification {
  final String _id;
  final String message;
  Coffee coffee = Coffee(
    name: "null",
    description: "null",
    smallPrice: 0,
    mediumPrice: 0,
    largePrice: 0,
    imageUrl: "imageUrl",
    categoryIDs: [],
    rating: 0,
  );

  notification({required this.message, Coffee? c, String? id})
    : _id = id ?? Uuid().v4() {
    if (c != null) {
      coffee = c;
    }
  }
}
