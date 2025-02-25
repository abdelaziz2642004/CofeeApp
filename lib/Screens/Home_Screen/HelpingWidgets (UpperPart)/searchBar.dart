import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class searchBar extends StatelessWidget {
  const searchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search coffee',
              hintStyle: TextStyle(color: Colors.white54),
              prefixIcon: Icon(Icons.search, color: Color(0xffebebeb)),
              filled: true,
              fillColor: Color(0xff2e2e2e), // Dark background
              contentPadding: EdgeInsets.symmetric(vertical: 18),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none, // No visible border
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(width: 17),
        Container(
          height: 59,
          width: 59,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 196, 124, 72), // Custom brownish color
            borderRadius: BorderRadius.circular(14),
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              width: 30,
              height: 30,
              'assets/icons/tune.svg', // Your SVG file path

              colorFilter: ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ), // Apply color if needed
            ),
          ),
        ),
      ],
    );
  }
}
