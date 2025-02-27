import 'package:flutter/material.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/Models/WishlistItem.dart';
import 'package:prj/Screens/WishListScreen/HelpingWidgets/Item/Item.dart';
import 'package:prj/Screens/WishListScreen/HelpingWidgets/finish/finish.dart';

class wishlistscreen extends StatefulWidget {
  @override
  State<wishlistscreen> createState() => _wishlistscreenState();
}

class _wishlistscreenState extends State<wishlistscreen> {
  List<WishlistItem> wishlist = [];
  void rebuildWidget() {
    setState(() {});
  }

  void checkout() {
    setState(() {
      currentUser.wishlist.Finish();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wishlist = currentUser.wishlist.items;
  }

  @override
  Widget build(BuildContext context) {
    wishlist = currentUser.wishlist.items;

    // print(wishlist);

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
                    'Items (${wishlist.length})',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DopisBold',
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currentUser.wishlist.Finish();
                      });
                    },
                    icon: Icon(Icons.delete_outline),
                    color: Color(0xffc47c51),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: wishlist.length,
                  itemBuilder: (context, index) {
                    Coffee coffee = wishlist[index].coffee;
                    // print(wishlist[index].size);
                    return Dismissible(
                      key: Key(wishlist[index].coffee.toString()),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [],
                        ),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          wishlist.removeAt(index);
                        });
                      },

                      child: CartItemCard(
                        item: wishlist[index],
                        coffee: coffee,
                        rebuildWidget: rebuildWidget,
                      ),
                    );
                  },
                ),
              ),

              if (wishlist.isNotEmpty) finish(checkout),
            ],
          ),
        ),
      ),
    );
  }
}
