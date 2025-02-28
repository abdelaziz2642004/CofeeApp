import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

List<Widget> CoffeeDescription({
  required String description,
  required int maxlines,
  required bool isOverflowing,
}) {
  return [
    Text(
      "Description",
      style: TextStyle(
        color: Color(0xff292929),
        fontWeight: FontWeight.bold,
        fontFamily: 'DopisBold',
        fontSize: 18,
      ),
    ),
    const SizedBox(height: 5),

    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReadMoreText(
          style: TextStyle(
            color: Color.fromARGB(255, 147, 147, 147),
            fontWeight: FontWeight.bold,
            fontFamily: 'DopisBold',
          ),

          description,
          trimLength: 120,
          colorClickableText: Colors.blue,
          trimMode: TrimMode.Length,
          trimCollapsedText: 'Read more',
          trimExpandedText: '  Read less',
          moreStyle: TextStyle(
            color: Color(0xffc47c51),
            fontWeight: FontWeight.bold,
            fontFamily: 'DopisBold',
            fontSize: 15,
          ),
          lessStyle: TextStyle(
            color: Color(0xffc47c51),
            fontWeight: FontWeight.bold,
            fontFamily: 'DopisBold',
            fontSize: 15,
          ),
        ),
      ],
    ),
  ];
}
