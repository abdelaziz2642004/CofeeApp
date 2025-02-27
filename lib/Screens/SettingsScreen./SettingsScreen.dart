import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSugary = true;
  bool isDairy = true;
  bool isDecaf = true;
  bool containsNuts = true;
  bool containsCaffeine = true;

  void _toggleFilter(String filterName) {
    setState(() {
      switch (filterName) {
        case 'Sugary':
          isSugary = !isSugary;
          break;
        case 'Dairy':
          isDairy = !isDairy;
          break;
        case 'Decaf':
          isDecaf = !isDecaf;
          break;
        case 'Nuts':
          containsNuts = !containsNuts;
          break;
        case 'Caffeine':
          containsCaffeine = !containsCaffeine;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('Settings'), backgroundColor: Colors.white),
        body: Column(
          children: [
            ListTile(
              title: Text('Change Password'),
              trailing: Icon(Icons.lock, color: Color(0xffc47c51)),
              onTap: () {
                // Handle password change
              },
            ),
            ListTile(
              title: Text('Delete Account'),
              trailing: Icon(Icons.delete, color: Colors.red),
              onTap: () {
                // Handle account deletion
              },
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Filter Coffees',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SwitchListTile(
              title: Text('Sugary'),
              value: isSugary,
              onChanged: (val) => _toggleFilter('Sugary'),
              activeColor: Color.fromARGB(255, 175, 75, 17),
            ),
            SwitchListTile(
              title: Text('Dairy'),
              value: isDairy,
              onChanged: (val) => _toggleFilter('Dairy'),
              activeColor: Color.fromARGB(255, 175, 75, 17),
            ),
            SwitchListTile(
              title: Text('Decaf'),
              value: isDecaf,
              onChanged: (val) => _toggleFilter('Decaf'),
              activeColor: Color.fromARGB(255, 175, 75, 17),
            ),
            SwitchListTile(
              title: Text('Contains Nuts'),
              value: containsNuts,
              onChanged: (val) => _toggleFilter('Nuts'),
              activeColor: Color.fromARGB(255, 175, 75, 17),
            ),
            SwitchListTile(
              title: Text('Contains Caffeine'),
              value: containsCaffeine,
              onChanged: (val) => _toggleFilter('Caffeine'),
              activeColor: Color.fromARGB(255, 175, 75, 17),
            ),
          ],
        ),
      ),
    );
  }
}
