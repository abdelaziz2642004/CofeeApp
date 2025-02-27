import 'package:flutter/material.dart';
import 'package:prj/DummyData.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  String fullName = currentUser.fullName;

  void _editFullName() {
    TextEditingController controller = TextEditingController(text: fullName);
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Edit Full Name'),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Enter new full name',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    fullName = controller.text;
                  });
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _editFullName,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                fullName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DopisBold',
                ),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.edit, size: 18, color: Colors.grey),
            ],
          ),
        ),
        Text(currentUser.email, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
