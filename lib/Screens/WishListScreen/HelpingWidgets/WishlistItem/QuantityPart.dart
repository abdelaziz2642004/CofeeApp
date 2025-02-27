import 'package:flutter/material.dart';
import 'package:prj/Models/WishlistItem.dart';

class quantityPart extends StatelessWidget {
  const quantityPart({
    super.key,
    required this.item,
    required this.changeQuantity,
    required this.removeItem,
  });
  final WishlistItem item;
  final void Function(int) changeQuantity;
  final void Function() removeItem;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Row(
      children: [
        Spacer(),

        IconButton(
          icon: Icon(Icons.remove_circle_outline, color: Colors.grey, size: 30),
          onPressed: () {
            changeQuantity(-1);
          },
        ),
        SizedBox(width: 10),

        Text(
          '${item.quantity}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'DopisBold',
            color: Color(0xffb2b2b2),
            fontSize: 18,
          ),
        ),
        SizedBox(width: 10),

        IconButton(
          icon: Icon(Icons.add_circle_outline, color: Colors.grey, size: 30),
          onPressed: () {
            changeQuantity(1);
          },
        ),

        SizedBox(width: 30),

        // Delete Button
        Container(
          decoration: BoxDecoration(
            color: Color(0xffc47c51),
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: Icon(Icons.delete, color: Colors.white),
            onPressed: () {
              removeItem();
            },
          ),
        ),
      ],
    );
  }
}
