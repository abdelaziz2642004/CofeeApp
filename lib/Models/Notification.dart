import 'package:prj/Models/Coffee.dart';

class notification {
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
  notification({required this.message, Coffee? c}) {
    if (c != null) coffee = c;
  }
}
