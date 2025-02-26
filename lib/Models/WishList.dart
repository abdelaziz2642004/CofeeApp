import 'package:prj/Models/WishlistItem.dart';

class Wishlist {
  final List<WishlistItem> items = [];
  double total = 0.0;
  void addItem(WishlistItem item) {
    if (item.size == 'L')
      total += item.coffee.price * 2 * item.quantity;
    else if (item.size == 'M')
      total += item.coffee.price * 1.5 * item.quantity;
    else
      total += item.coffee.price * item.quantity;

    items.add(item);
  }
}
