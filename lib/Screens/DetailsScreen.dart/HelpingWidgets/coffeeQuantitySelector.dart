import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<Widget> quantitySelector(int quantity, void Function(int) changeQuantity) {
  return [
    Text(
      "Quantity",
      style: TextStyle(
        color: Color(0xff292929),
        fontWeight: FontWeight.bold,
        fontFamily: 'DopisBold',
        fontSize: 18,
      ),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.remove_circle_outline, color: Colors.grey, size: 60),
          onPressed: () {
            changeQuantity(-1);
          },
        ),
        // Spacer(),
        SizedBox(width: 60),

        Text(
          '${quantity}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'DopisBold',
            color: Color(0xffb2b2b2),
            fontSize: 40,
          ),
        ),
        SizedBox(width: 60),

        // Spacer(),
        IconButton(
          icon: Icon(Icons.add_circle_outline, color: Colors.grey, size: 60),
          onPressed: () {
            changeQuantity(1);
          },
        ),
      ],
    ),
  ];
}
