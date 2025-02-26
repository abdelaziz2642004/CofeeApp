import 'package:uuid/uuid.dart';

final Uuid uuid = Uuid();

class WishlistItem {
  final String id;
  // final String userId; // Since we will add the wishlist to the user model, we don't need to store the userId in the wishlist item.
  final String coffeeId;
  int quantity;
  final DateTime addedAt;

  WishlistItem({
    String? id,
    required this.coffeeId,
    required this.addedAt,
    required this.quantity,
  }) : id = id ?? uuid.v4();
}
