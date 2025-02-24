import 'package:flutter/material.dart';

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
              prefixIcon: Icon(Icons.search, color: Colors.white),
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
            icon: Icon(Icons.tune, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
