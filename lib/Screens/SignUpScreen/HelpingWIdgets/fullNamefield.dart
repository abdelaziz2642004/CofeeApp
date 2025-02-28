import 'package:flutter/material.dart';

class fullNameField extends StatelessWidget {
  fullNameField({required this.onChanged});
  final void Function(String) onChanged;
  //            onChanged: (value) => _fullName = value, // will be passed

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged, // will be passed
      validator: (val) {
        if (val == '') return 'Field cannot be empty';
      },
      decoration: InputDecoration(
        labelText: 'Full Name',
        labelStyle: TextStyle(fontFamily: "DopisBold"),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        prefixIcon: const Icon(Icons.email, color: Color(0xffc47c51)),
      ),
    );
  }
}
