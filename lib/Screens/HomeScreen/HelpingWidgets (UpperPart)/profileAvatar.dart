import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prj/DummyData.dart';
import 'package:prj/Screens/ProfileScreen/profileScreen.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  void _openProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder:
          (context) => [
            const PopupMenuItem(value: 1, child: Text('Settings & Profile')),
          ],
      onSelected: (value) {
        if (value == 1) {
          _openProfile(context);
        }
      },
      child: CircleAvatar(
        radius: 20,
        backgroundImage:
            currentUser.ImageUrl.isNotEmpty
                ? CachedNetworkImageProvider(currentUser.ImageUrl)
                : const AssetImage('assets/images/profile.jpg')
                    as ImageProvider,
      ),
    );
  }
}
