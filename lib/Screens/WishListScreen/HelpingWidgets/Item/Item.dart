import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/Models/WishlistItem.dart';
import 'package:prj/Screens/WishListScreen/HelpingWidgets/Item/PriceAndSize.dart';
import 'package:prj/Screens/WishListScreen/HelpingWidgets/Item/QuantityPart.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({
    required this.item,
    super.key,
    required this.coffee,
    required this.rebuildWidget,
  });
  final WishlistItem item;
  final Coffee coffee;
  final void Function() rebuildWidget;
  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  void changeQuantity(int x) {
    widget.item.quantity += x;
    if (item.quantity <= 0) {
      removeItem();
    } else {
      setState(() {});
      currentUser.wishlist.total += x * widget.item.coffee.getPrice(item.size);
      // widget.rebuildWidget;
    }
  }

  void removeItem() {
    setState(() {
      currentUser.wishlist.items.remove(widget.item);
      currentUser.wishlist.total -=
          item.quantity * widget.item.coffee.getPrice(item.size);
      // widget.rebuildWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              imageUrl: widget.coffee.imageUrl,
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
                  widget.coffee.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'DopisBold',
                  ),
                ),
                priceAndSize(widget.coffee, widget.item),
                quantityPart(
                  item: widget.item,
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
