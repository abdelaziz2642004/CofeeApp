import 'package:flutter/material.dart';

List<Widget> CoffeeDescription({
  required String description,
  required bool isExpanded,
  required int maxlines,
  required bool isOverflowing,
  required void Function() onToggleExpand,
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
        Text(
          description,
          maxLines: maxlines,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'DopisBold',
            fontSize: 14.5,
            color:
                isOverflowing
                    ? Color(0xffb2b2b2)
                    : const Color.fromARGB(162, 17, 16, 16),
          ),
        ),
        if (isOverflowing || maxlines == 100)
          GestureDetector(
            onTap: onToggleExpand,
            child: Text(
              isExpanded ? "Read Less" : "...Read More",
              style: TextStyle(
                color: Color(0xffc47c51),
                fontWeight: FontWeight.bold,
                fontFamily: 'DopisBold',
                fontSize: 15,
              ),
            ),
          ),
      ],
    ),
  ];
}
