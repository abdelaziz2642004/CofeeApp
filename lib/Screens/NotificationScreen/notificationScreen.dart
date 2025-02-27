import 'package:flutter/material.dart';
import 'package:prj/Models/Notification.dart';
import 'package:prj/DummyData.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:prj/Screens/NotificationScreen/HelpingWidgets/notificationItem.dart';

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
          'Notifications',
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
                  return NotificationItem(item: notifications[index]);
                },
              ),
    );
  }
}
