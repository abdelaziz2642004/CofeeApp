import 'package:uuid/uuid.dart';

final Uuid uuid = Uuid();

class WishlistItem {
  final String id;
  final String userId;
  final String coffeeId;
  final DateTime addedAt;

  WishlistItem({
    String? id,
    required this.userId,
    required this.coffeeId,
    required this.addedAt,
  }) : id = id ?? uuid.v4();
}
