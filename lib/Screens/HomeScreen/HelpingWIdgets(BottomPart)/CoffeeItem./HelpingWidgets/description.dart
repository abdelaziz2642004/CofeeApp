import 'package:flutter/material.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/Models/WishlistItem.dart';

Widget descriptionWidget(Coffee coffee) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 150,
        height: 30,

        child: Text(
          coffee.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontFamily: 'DopisBold',
            fontSize: 18,
          ),
        ),
      ),
      Text(
        categories
            .firstWhere((category) => category.id == coffee.categoryIDs[0])
            .name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,

        style: TextStyle(
          color: Color(0xffb5b5b5),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),

      SizedBox(height: 8),
      Row(
        children: [
          Text(
            "\$ ${coffee.getPrice('S')}",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              fontFamily: 'AlongSanss',
              color: Colors.black,
            ),
          ),
          SizedBox(width: 50),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Color(0xffc47c51),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () {
                int index = -1;
                for (int i = 0; i < currentUser.wishlist.items.length; i++) {
                  WishlistItem item = currentUser.wishlist.items[i];
                  if (item.coffee.id == coffee.id && item.size == 'S') {
                    index = i;
                    break;
                  }
                }
                if (index != -1) {
                  currentUser.wishlist.items[index].quantity++;
                  currentUser.wishlist.total += currentUser
                      .wishlist
                      .items[index]
                      .coffee
                      .getPrice('S');
                  return;
                }
                WishlistItem item = WishlistItem(
                  coffee: coffee,
                  addedAt: DateTime.now(),
                  quantity: 1,
                  size: 'S',
                );
                currentUser.wishlist.addItem(item);
                return;
              },
              icon: Icon(Icons.add),
              color: Colors.white,
            ),
          ),
        ],
      ),
    ],
  );
}
