import 'package:prj/Models/WishlistItem.dart';

class Wishlist {
  final List<WishlistItem> items;
  double total = 0.0;

  Wishlist({required this.items, required this.total});

  void addItem(WishlistItem item) {
    total += item.coffee.getPrice(item.size) * item.quantity;
    items.add(item);
  }

  void Finish() {
    items.clear();
    total = 0.0;
  }
}
