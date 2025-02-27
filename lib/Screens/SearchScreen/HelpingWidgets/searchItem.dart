import 'package:flutter/material.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/Screens/SearchScreen/HelpingWidgets/SearchLogic.dart';
import 'package:prj/DummyData.dart';

class SearchItem extends StatelessWidget {
  final Coffee coffee;
  final String searchQuery;
  final VoidCallback onTap;

  const SearchItem({
    required this.coffee,
    required this.searchQuery,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 150,
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                coffee.imageUrl,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: [
                    highlightText(
                      coffee.name,
                      searchQuery,
                      size: 20,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(height: 4),
                    highlightText(
                      coffee.categoryIDs
                          .map((id) => categoryMap[id]!)
                          .join(' / '),
                      searchQuery,
                      size: 14,
                      weight: FontWeight.normal,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
