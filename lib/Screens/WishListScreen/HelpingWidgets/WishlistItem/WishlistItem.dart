import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/Models/WishlistItem.dart';
import 'package:prj/Screens/WishListScreen/HelpingWidgets/WishlistItem/PriceAndSize.dart';
import 'package:prj/Screens/WishListScreen/HelpingWidgets/WishlistItem/QuantityPart.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({required this.item, super.key, required this.rebuild});
  final WishlistItem item;
  final void Function() rebuild;

  void changeQuantity(int x) {
    item.quantity += x;
    if (item.quantity <= 0) {
      removeItem();
      return;
    } else {
      currentUser.wishlist.total += x * item.coffee.getPrice(item.size);
    }
    rebuild();
  }

  void removeItem() {
    // currentUser.wishlist.total -=
    //     item.quantity * item.coffee.getPrice(item.size); // OMG IM SO DUMB WHY DO I MULTIPLY BY 0
    currentUser.wishlist.total -= item.coffee.getPrice(item.size);
    currentUser.wishlist.items.remove(item);

    rebuild();
  }

  @override
  Widget build(BuildContext context) {
    final Coffee coffee = item.coffee;
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 236, 236, 236),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: coffee.imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  coffee.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'DopisBold',
                  ),
                ),
                priceAndSize(coffee, item),
                quantityPart(
                  item: item,
                  changeQuantity: changeQuantity,
                  removeItem: removeItem,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
