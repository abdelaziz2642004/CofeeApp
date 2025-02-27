import 'package:flutter/material.dart';
import 'package:prj/Screens/WishListScreen/HelpingWidgets/WishlistItem/WishlistItem.dart';
import 'package:prj/Screens/WishListScreen/HelpingWidgets/Logic.dart';
import 'package:prj/Screens/WishListScreen/HelpingWidgets/finish/finish.dart';

class WishlistWidgets extends StatelessWidget {
  final WishlistLogic wishlistLogic;
  final VoidCallback onCheckout;
  final Function(int) onRemoveItem;
  final Function() rebuild;

  WishlistWidgets({
    required this.wishlistLogic,
    required this.onCheckout,
    required this.onRemoveItem,
    required this.rebuild,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Wishlist',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'DopisBold',
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Items (${wishlistLogic.wishlist.length})',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DopisBold',
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: onCheckout,
                    icon: Icon(Icons.delete_outline),
                    color: Color(0xffc47c51),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: wishlistLogic.wishlist.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(wishlistLogic.wishlist[index].coffee.toString()),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      onDismissed: (direction) => onRemoveItem(index),
                      child: CartItemCard(
                        item: wishlistLogic.wishlist[index],
                        rebuild: rebuild,
                      ),
                    );
                  },
                ),
              ),
              if (wishlistLogic.wishlist.isNotEmpty) finish(onCheckout),
            ],
          ),
        ),
      ),
    );
  }
}
