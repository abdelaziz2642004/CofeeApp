import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/Models/WishlistItem.dart';

class Addtocart extends StatelessWidget {
  const Addtocart({
    super.key,
    required this.coffee,
    required this.size,
    required this.quantity,
  });
  final Coffee coffee;
  final String size;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
                  CrossAxisAlignment.center, // Ensures vertical alignment
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
                      '\$${coffee.getPrice(size)}',
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
                    onPressed: () {
                      int index = -1;
                      for (
                        int i = 0;
                        i < currentUser.wishlist.items.length;
                        i++
                      ) {
                        WishlistItem item = currentUser.wishlist.items[i];
                        if (item.coffee.id == coffee.id && item.size == size) {
                          index = i;
                          break;
                        }
                      }
                      if (index != -1) {
                        currentUser.wishlist.items[index].quantity += quantity;
                        currentUser.wishlist.total +=
                            currentUser.wishlist.items[index].coffee.getPrice(
                              size,
                            ) *
                            quantity;
                        Navigator.pop(context);
                        return;
                      }

                      WishlistItem item = WishlistItem(
                        coffee: coffee,
                        addedAt: DateTime.now(),
                        quantity: quantity,
                        size: size,
                      );
                      currentUser.wishlist.addItem(item);
                      Navigator.pop(context);
                      return;
                    },
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
    );
  }
}
