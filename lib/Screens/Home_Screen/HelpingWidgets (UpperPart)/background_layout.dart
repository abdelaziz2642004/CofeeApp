import 'package:flutter/material.dart';

class BackgroundLayout extends StatelessWidget {
  const BackgroundLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 11,
          child: Container(color: const Color(0xFF222222)), // Top half
        ),
        Expanded(
          flex: 25,
          child: Container(color: Colors.white), // Bottom half
        ),
      ],
    );
  }
}
