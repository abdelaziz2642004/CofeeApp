import 'package:prj/DummyData.dart';
import 'package:prj/Models/WishlistItem.dart';

class WishlistLogic {
  List<WishlistItem> wishlist = [];

  void loadWishlist() {
    wishlist = currentUser.wishlist.items;
  }

  void checkout() {
    currentUser.wishlist.Finish();
    wishlist = [];
  }

  void removeItem(int index) {
    wishlist.removeAt(index);
    wishlist = currentUser.wishlist.items;
  }
}
