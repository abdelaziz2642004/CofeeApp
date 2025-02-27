import 'package:flutter/material.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/Models/WishlistItem.dart';

Widget priceAndSize(Coffee coffee, WishlistItem item) {
  return Row(
    children: [
      Text(
        '\$${(coffee.getPrice(item.size) * item.quantity).toStringAsFixed(2)}  ',
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'DopisBold',
          color: Color(0xffb2b2b2),
        ),
      ),
      SizedBox(height: 4),

      Text(
        item.size == 'L'
            ? '-  Large '
            : item.size == 'M'
            ? '-  Medium'
            : '-  Small',
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'DopisBold',
          color: Color(0xffb2b2b2),
        ),
      ),
    ],
  );
}
