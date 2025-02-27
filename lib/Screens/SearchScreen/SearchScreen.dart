import 'package:flutter/material.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/Screens/DetailsScreen.dart/Details.dart';
import 'package:prj/Screens/SearchScreen/HelpingWidgets/SearchLogic.dart';
import 'package:prj/Screens/SearchScreen/HelpingWidgets/searchItem.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Coffee> filteredList = List.from(coffees);
  String searchQuery = "";

  void _filterSearch(String query) {
    setState(() {
      searchQuery = query;
      filteredList = filterCoffeeList(query);
    });
  }

  void goToDetails(Coffee coffee) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CoffeeDetailsScreen(coffee: coffee),
      ),
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
                  return SearchItem(
                    coffee: filteredList[index],
                    searchQuery: searchQuery,
                    onTap: () => goToDetails(filteredList[index]),
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
