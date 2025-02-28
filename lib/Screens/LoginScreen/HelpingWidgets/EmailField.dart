import 'package:flutter/material.dart';

class EmailorUsernameField extends StatelessWidget {
  final Function(String) onChanged;
  const EmailorUsernameField({required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value == null) {
          return 'Field cannot be empty';
        }
        if (value.contains('@') &&
            !RegExp(
              r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
            ).hasMatch(value)) {
          return ' This email is invalid';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Email or Username',
        labelStyle: TextStyle(fontFamily: "DopisBold"),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        prefixIcon: const Icon(Icons.email, color: Color(0xffc47c51)),
      ),
    );
  }
}
