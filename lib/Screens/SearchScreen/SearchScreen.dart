import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/Providers/drinksProvider.dart';
import 'package:prj/Screens/DetailsScreen.dart/Details.dart';
import 'package:prj/Screens/HomeScreen/HelpingWidgets%20(UpperPart)/filterMenu.dart';
import 'package:prj/Screens/SearchScreen/HelpingWidgets/SearchLogic.dart';
import 'package:prj/Screens/SearchScreen/HelpingWidgets/searchItem.dart';

class SearchScreen extends ConsumerStatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Coffee> filteredList = [];
  String searchQuery = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredList = ref.read(drinksProvider).value!;
  }

  void _filterSearch(String query) {
    setState(() {
      searchQuery = query;
      filteredList = filterCoffeeList(query, ref.read(drinksProvider).value!);
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
      appBar: AppBar(
        title: const Text(
          'Search Coffee',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'DopisBold',
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),

                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: _filterSearch,
                  ),
                ),
                SizedBox(width: 10),
                FilterMenu(),
              ],
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
