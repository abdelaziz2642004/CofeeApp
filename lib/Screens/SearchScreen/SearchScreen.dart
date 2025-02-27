import 'package:flutter/material.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/Screens/DetailsScreen.dart/Details.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Coffee> filteredList = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    filteredList = List.from(coffees);
  }

  void _filterSearch(String query) {
    setState(() {
      searchQuery = query;
      filteredList =
          coffees.where((coffee) {
            return coffee.name.toLowerCase().contains(query.toLowerCase()) ||
                coffee.categoryIDs.any(
                  (category) => categoryMap[category]!.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
                );
          }).toList();
    });
  }

  Widget _highlightText(
    String text,
    String query,
    double size,
    FontWeight weight,
  ) {
    if (query.isEmpty) {
      return Text(
        text,
        style: TextStyle(
          fontSize: size,
          color: Colors.white,
          fontWeight: weight,
        ),
      );
    }

    List<TextSpan> spans = [];
    int start = 0;
    String lowerText = text.toLowerCase();
    String lowerQuery = query.toLowerCase();

    while (start < text.length) {
      int index = lowerText.indexOf(lowerQuery, start);
      if (index == -1) {
        spans.add(TextSpan(text: text.substring(start)));
        break;
      }
      if (index > start) {
        spans.add(TextSpan(text: text.substring(start, index)));
      }
      spans.add(
        TextSpan(
          text: text.substring(index, index + query.length),
          style: TextStyle(
            fontWeight: weight,
            color: Colors.green,
            fontSize: size,
          ),
        ),
      );
      start = index + query.length;
    }

    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontSize: size,
          fontWeight: weight,
        ),
        children: spans,
      ),
    );
  }

  void goToDetails(Coffee coffee) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CoffeeDetailsScreen(coffee: coffee),
      ), // Replace with your search screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Coffee')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _filterSearch,
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      goToDetails(filteredList[index]);
                    },
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
                              filteredList[index].imageUrl,
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
                                  _highlightText(
                                    filteredList[index].name,
                                    searchQuery,
                                    20,
                                    FontWeight.bold,
                                  ),
                                  SizedBox(height: 4),
                                  _highlightText(
                                    filteredList[index].categoryIDs
                                        .map((id) => categoryMap[id]!)
                                        .join(' / '),
                                    searchQuery,
                                    14,
                                    FontWeight.normal,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
