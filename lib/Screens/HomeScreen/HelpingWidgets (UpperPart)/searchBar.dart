import 'package:flutter/material.dart';

import 'package:prj/Screens/SearchScreen/SearchScreen.dart';

class searchBar extends StatelessWidget {
  const searchBar({super.key});

  void _navigateToSearchScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchScreen(),
      ), // Replace with your search screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => _navigateToSearchScreen(context),
            borderRadius: BorderRadius.circular(14),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                color: Color(0xff2e2e2e),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  SizedBox(width: 16),
                  Icon(Icons.search, color: Color(0xffebebeb)),
                  SizedBox(width: 12),
                  Text(
                    'Search coffee',
                    style: TextStyle(color: Colors.white54, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 17),
      ],
    );
  }
}
