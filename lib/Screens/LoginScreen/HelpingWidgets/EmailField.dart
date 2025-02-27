import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final Function(String) onChanged;
  const EmailField({required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator:
          (value) =>
              (value == null || !value.contains('@'))
                  ? 'Enter a valid Email'
                  : null,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(fontFamily: "DopisBold"),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        prefixIcon: const Icon(Icons.email, color: Color(0xffc47c51)),
      ),
    );
  }
}
