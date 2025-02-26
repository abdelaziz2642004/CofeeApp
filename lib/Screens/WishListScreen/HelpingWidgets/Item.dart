import 'package:flutter/material.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/Models/WishlistItem.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({required this.item, super.key, required this.coffee});
  final WishlistItem item;
  final Coffee coffee;
  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Align top elements

        children: [
          // Coffee Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/1.jpeg',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),

          // Text & Details (Expanded to take available space)
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
                Row(
                  children: [
                    Text(
                      '\$${widget.coffee.price * widget.item.quantity}  ',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'DopisBold',
                        color: Color(0xffb2b2b2),
                      ),
                    ),
                    SizedBox(height: 4),

                    Text(
                      widget.item.size == 'l'
                          ? '-  Large '
                          : widget.item.size == 'M'
                          ? '-  Medium'
                          : '-  Small',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'DopisBold',
                        color: Color(0xffb2b2b2),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Spacer(),

                    IconButton(
                      icon: Icon(
                        Icons.remove_circle_outline,
                        color: Colors.grey,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: 10),

                    Text(
                      '${widget.item.quantity}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'DopisBold',
                        color: Color(0xffb2b2b2),
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 10),

                    IconButton(
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: Colors.grey,
                        size: 30,
                      ),
                      onPressed: () {},
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
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Controls (Wrapped in a Column & pushed to the bottom)
        ],
      ),
    );
  }
}
