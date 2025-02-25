import 'package:flutter/material.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Models/category.dart';

// we made this stateful , why ?
// because instead of completely rebuilding the home_screen !!
// why not just rebuild this part only ?

class Catlist extends StatelessWidget {
  const Catlist({
    super.key,
    required void Function(category)? rebuild,
    required this.cat,
  }) : _rebuild = rebuild;
  final void Function(category)? _rebuild;
  final category cat;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length, // Number of list items
        itemBuilder: (context, index) {
          bool isSelected = cat == categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GestureDetector(
              onTap: () {
                _rebuild!(categories[index]);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xffc47c51) : Colors.white,
                  borderRadius: BorderRadius.circular(7),
                  boxShadow:
                      isSelected
                          ? []
                          : [
                            BoxShadow(color: Colors.transparent),
                          ], // No outline
                ),
                child: Center(
                  child: Text(
                    categories[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Color(0xff3f3f3f),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
