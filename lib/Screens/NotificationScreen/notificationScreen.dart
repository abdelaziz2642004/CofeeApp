import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prj/Models/Notification.dart';

import 'package:prj/DummyData.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:prj/Screens/DetailsScreen.dart/Details.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<notification> notifications = currentUser.notifications;
  String? emptyMessage;

  @override
  void initState() {
    super.initState();
    if (notifications.isEmpty) {
      loadEmptyMessage();
    }
  }

  Future<void> loadEmptyMessage() async {
    final String response = await rootBundle.loadString(
      'assets/json/Welcome.json',
    );
    final data = json.decode(response);
    setState(() {
      emptyMessage = data["message"] ?? "No notifications yet.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'DopisBold',
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body:
          notifications.isEmpty
              ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    emptyMessage ?? "No notifications yet.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'DopisBold',
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
              : ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification item = notifications[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  CoffeeDetailsScreen(coffee: item.coffee),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 236, 213, 200),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl: item.coffee.imageUrl,
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              item.message,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'DopisBold',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
