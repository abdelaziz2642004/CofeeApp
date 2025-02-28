import 'package:flutter/material.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/Screens/DetailsScreen.dart/HelpingWidgets/CustomAppBar.dart';
import 'package:prj/Screens/DetailsScreen.dart/HelpingWidgets/addToCart.dart';
import 'package:prj/Screens/DetailsScreen.dart/HelpingWidgets/cofeeImage.dart';
import 'package:prj/Screens/DetailsScreen.dart/HelpingWidgets/coffeeDescription.dart';
import 'package:prj/Screens/DetailsScreen.dart/HelpingWidgets/coffeeInfo.dart';
import 'package:prj/Screens/DetailsScreen.dart/HelpingWidgets/coffeeQuantitySelector.dart';
import 'package:prj/Screens/DetailsScreen.dart/HelpingWidgets/coffeeSizeSelector.dart';

class CoffeeDetailsScreen extends StatefulWidget {
  const CoffeeDetailsScreen({super.key, required this.coffee});

  final Coffee coffee;

  @override
  State<CoffeeDetailsScreen> createState() => _CoffeeDetailsScreenState();
}

/*
TextPainter is a Flutter class that helps measure and layout text before it is rendered on the screen.
We provide a TextSpan, which is a class representing a piece of text with styling.
text: widget.text → This is the full text from the widget.
style: TextStyle(fontSize: 16) → This applies a font size of 16 to the text.
*/

class _CoffeeDetailsScreenState extends State<CoffeeDetailsScreen> {
  String selectedSize = 'S';
  bool isFavorite = true;
  bool isExpanded = false;
  bool isOverflowing = false;
  int maxlines = 2;
  int selectedQuantity = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFavorite = currentUser.favorited.contains(widget.coffee.id);
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        currentUser.favorited.add(widget.coffee.id);
      }
    });
  }

  void checkOverflow() {
    if (isOverflowing) {
      isOverflowing = false;
    }
    final textPainter = TextPainter(
      text: TextSpan(
        text: widget.coffee.description,
        style: TextStyle(fontSize: 20),
      ), // just like down there
      maxLines: maxlines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: MediaQuery.of(context).size.width - 50);

    setState(() {
      isOverflowing = textPainter.didExceedMaxLines;
    });
  }

  void chooseSize(String newSize) {
    // print("Size Selected");
    setState(() {
      selectedSize = newSize;
    });
    // print(selectedSize);
  }

  void changeQuantity(int x) {
    // print(quantity);
    // print(x);
    setState(() {
      selectedQuantity += x;
      if (selectedQuantity < 1) selectedQuantity = 1;
    });
    // print(quantity);
  }

  @override
  Widget build(BuildContext context) {
    checkOverflow();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff9f9f9),
        appBar: customAppBar(
          isFavorite: isFavorite,
          toggleFavorite: toggleFavorite,
          context: context,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                // this will now take as much availabe space as possible :D
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CoffeeImage(imageUrl: widget.coffee.imageUrl),
                    const SizedBox(height: 12),
                    ...CoffeeInfo(widget.coffee),
                    const SizedBox(height: 14),
                    ...CoffeeDescription(
                      description: widget.coffee.description,
                      maxlines: maxlines,
                      isOverflowing: isOverflowing,
                    ),

                    // ANOTHER OPTION FOR Quantity
                    const SizedBox(height: 14),
                    // babasy el selected size to color the selected one differently
                    ...SizeSelector(
                      selectedSize: selectedSize,
                      chooseSize: chooseSize,
                    ),
                    const SizedBox(height: 14),

                    ...quantitySelector(selectedQuantity, changeQuantity),
                  ],
                ),
              ),
            ),
            Addtocart(
              coffee: widget.coffee,
              size: selectedSize,
              quantity: selectedQuantity,
            ),
          ],
        ),
      ),
    );
  }
}
