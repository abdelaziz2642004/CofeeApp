import 'package:flutter/material.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/Models/WishlistItem.dart';
import 'package:prj/Screens/DetailsScreen.dart/HelpingWidgets/addToCart.dart';
import 'package:prj/Screens/WishListScreen/HelpingWidgets/Item.dart';

class CartScreen extends StatelessWidget {
  final List<WishlistItem> wishlist = currentUser.wishlist.items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onPressed: () {},
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

                  return Dismissible(
                    key: Key(wishlist[index].coffee.toString()),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.delete, color: Colors.white, size: 30),
                    ),
                    onDismissed: (direction) {
                      wishlist.removeAt(index);
                    },

                    child: CartItemCard(item: wishlist[index], coffee: coffee),
                  );
                },
              ),
            ),

            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                height: 120,
                width: double.infinity,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .center, // Ensures vertical alignment
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment:
                              MainAxisAlignment.center, // Align text vertically
                          children: [
                            Text(
                              "Price",
                              style: TextStyle(
                                color: Color(0xff999999),
                                fontWeight: FontWeight.normal,
                                fontFamily: 'DopisBold',
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "\$ ${currentUser.wishlist.total}",
                              style: const TextStyle(
                                color: Color(0xffc47c51),
                                fontWeight: FontWeight.normal,
                                fontFamily: 'DopisBold',
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 73,
                                vertical: 17,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              backgroundColor: Color(0xffc47c51),
                            ),
                            child: const Text(
                              "Add to Cart",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.normal,
                                fontFamily: 'DopisBold',
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
