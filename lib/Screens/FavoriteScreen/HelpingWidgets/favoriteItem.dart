import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prj/Models/Coffee.dart';
import 'package:prj/Screens/DetailsScreen.dart/Details.dart';
import 'package:prj/DummyData.dart';

class FavoriteItem extends StatelessWidget {
  final Coffee coffee;
  final Function(String) onToggleFavorite;

  const FavoriteItem({
    super.key,
    required this.coffee,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(coffee.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => onToggleFavorite(coffee.id),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CoffeeDetailsScreen(coffee: coffee),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 203, 203, 203),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: coffee.imageUrl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffee.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'DopisBold',
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      coffee.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  currentUser.favorited.contains(coffee.id)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: const Color(0xffc47c51),
                ),
                onPressed: () => onToggleFavorite(coffee.id),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
