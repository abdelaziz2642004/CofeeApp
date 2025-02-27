import 'package:prj/Models/WishlistItem.dart';

class Wishlist {
  List<WishlistItem> items = [];
  double total = 0.0;
  void addItem(WishlistItem item) {
    total += item.coffee.getPrice(item.size) * item.quantity;
    items.add(item);
  }

  void Finish() {
    items = [];
    total = 0.0;
  }
}
