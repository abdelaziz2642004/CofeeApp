import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/DummyData.dart';

List<Widget> CoffeeInfo(Coffee coffee) {
  return [
    Text(
      coffee.name,
      style: TextStyle(
        color: Color(0xff292929),
        fontWeight: FontWeight.bold,
        fontFamily: 'DopisBold',
        fontSize: 25,
      ),
    ),
    Text(
      coffee.categoryIDs
          .map((catID) => categoryMap[catID] ?? 'Unknown Category')
          .join(' / '),
      style: TextStyle(
        color: Color(0xffb2b2b2),
        fontFamily: 'DopisBold',
        fontSize: 13,
      ),
    ),
    SizedBox(height: 10),
    Row(
      children: [
        const Icon(Icons.star, color: Color(0xfffabd2f), size: 25),
        Text(
          " ${coffee.rating} ",
          style: TextStyle(
            color: Color(0xff292929),
            fontWeight: FontWeight.bold,
            fontFamily: 'DopisBold',
            fontSize: 18,
          ),
        ),
        Text(
          "(${coffee.ratingCount})",
          style: TextStyle(
            color: Color(0xffb2b2b2),
            fontWeight: FontWeight.bold,
            fontFamily: 'DopisBold',
            fontSize: 18,
          ),
        ),
        Spacer(),
        if (coffee.isDairy)
          SvgPicture.asset('assets/icons/milk.svg', width: 30, height: 30),
        if (coffee.isSugary)
          SvgPicture.asset('assets/icons/sugar.svg', width: 30, height: 30),
        if (coffee.containsCaffeine) SizedBox(width: 4),
        if (coffee.containsCaffeine)
          SvgPicture.asset('assets/icons/beans.svg', width: 30, height: 30),
        if (coffee.containsNuts) SizedBox(width: 4),
        if (coffee.containsNuts)
          SvgPicture.asset('assets/icons/nuts.svg', width: 30, height: 30),
        if (coffee.isDecaf)
          SvgPicture.asset('assets/icons/decaf.svg', width: 36, height: 36),
      ],
    ),
    SizedBox(height: 14),
    Center(
      child: Container(
        width: 330,
        height: 1,
        color: Color.fromARGB(255, 181, 181, 181),
      ),
    ),
  ];
}
