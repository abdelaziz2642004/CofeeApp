import 'package:flutter/material.dart';

// we made this stateful , why ?
// because instead of completely rebuilding the home_screen !!
// why not just rebuild this part only ?

class Catlist extends StatelessWidget {
  const Catlist({
    super.key,
    required void Function(int)? rebuild,
    required int index,
  }) : _index = index,
       _rebuild = rebuild;
  final void Function(int)? _rebuild;
  final int _index;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 200, // Number of list items
        itemBuilder: (context, index) {
          bool isSelected = _index == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GestureDetector(
              onTap: () {
                _rebuild!(index);
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
                    "Category ${index + 1}",
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
