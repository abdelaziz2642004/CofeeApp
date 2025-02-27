import 'package:flutter/material.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Screens/WishListScreen/WishlistScreen.dart';
import 'package:prj/Screens/FavoriteScreen/FavortieScreen.dart';
import 'package:prj/Screens/SettingsScreen./SettingsScreen.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text(
            'Wishlist',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'DopisBold',
            ),
          ),
          subtitle: Text('${currentUser.wishlist.items.length} items'),
          leading: const Icon(Icons.shopping_bag, color: Color(0xffc47c51)),
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => wishlistscreen()),
              ),
        ),
        ListTile(
          title: const Text(
            'Favorited Items',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'DopisBold',
            ),
          ),
          subtitle: Text('${currentUser.favorited.length} items'),
          leading: const Icon(Icons.favorite, color: Color(0xffc47c51)),
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesScreen()),
              ),
        ),
        ListTile(
          title: const Text(
            'Settings & Preferences',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'DopisBold',
            ),
          ),
          subtitle: const Text('Manage account settings'),
          leading: const Icon(Icons.settings, color: Color(0xffc47c51)),
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              ),
        ),
      ],
    );
  }
}
