import 'package:flutter/material.dart';
import 'package:prj/Screens/ProfileScreen/HelpingWidgets/profileInfo.dart';
import 'package:prj/Screens/ProfileScreen/HelpingWidgets/profileOptions.dart';
import 'package:prj/Screens/ProfileScreen/HelpingWidgets/profilePic.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'DopisBold',
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfilePicture(),
              SizedBox(height: 16),
              ProfileInfo(),
              Divider(),
              ProfileOptions(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffc47c51),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
