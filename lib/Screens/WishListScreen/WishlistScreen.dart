import 'package:flutter/material.dart';
import 'package:prj/Screens/WishListScreen/HelpingWidgets/Logic.dart';
import 'package:prj/Screens/WishListScreen/HelpingWidgets/wishlistWidgets.dart';

class WishlistScreen extends StatefulWidget {
  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  WishlistLogic wishlistLogic = WishlistLogic();

  @override
  void initState() {
    super.initState();
    wishlistLogic.loadWishlist();
  }

  @override
  Widget build(BuildContext context) {
    return WishlistWidgets(
      wishlistLogic: wishlistLogic,
      onCheckout: () {
        wishlistLogic.checkout();

        setState(() {
          print("helloooo");
        });
      },
      onRemoveItem: (index) {
        wishlistLogic.removeItem(index);

        setState(() {});
      },
      rebuild: () {
        setState(() {});
      },
    );
  }
}
