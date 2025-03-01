import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prj/Models/category.dart';
import 'package:prj/Providers/categoriesProvider.dart';

// we made this stateful , why ?
// because instead of completely rebuilding the home_screen !!
// why not just rebuild this part only ?

class Catlist extends ConsumerWidget {
  const Catlist({super.key, required this.rebuild, required this.cat});
  final void Function(category) rebuild;
  final category cat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<category> categories = ref.watch(categoriesProvider).value ?? [];
    print(cat.name + cat.id);
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length, // Number of list items
        itemBuilder: (context, index) {
          bool isSelected = cat.id == categories[index].id;
          // print(categories[index].name + categories[index].id);
          // print(isSelected);
          // print("------------------------------------------");

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GestureDetector(
              onTap: () {
                rebuild(categories[index]);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xffc47c51) : Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Text(
                    categories[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "DopisBold",
                      fontSize: 16,
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
