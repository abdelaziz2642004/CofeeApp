import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prj/Models/Coffee.dart';

class Addtocart extends StatelessWidget {
  const Addtocart({super.key, required this.coffee});
  final Coffee coffee;
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
                      "\$ ${coffee.price}",
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
    );
  }
}
