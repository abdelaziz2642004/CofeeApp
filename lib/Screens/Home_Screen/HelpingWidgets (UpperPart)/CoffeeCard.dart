import 'package:flutter/material.dart';

class Coffeecard extends StatelessWidget {
  const Coffeecard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 165,
          width: 400,
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Image.asset("assets/images/4.jpeg", fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 17,
          left: 25,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
              color: Color(0xffea5554),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "Promo",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),

        Positioned(
          top: 50,
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: const Text(
              "Get 70% off \n on Sundays!",
              style: TextStyle(
                color: Color.fromARGB(255, 122, 62, 6),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
