import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final bool obscurePassword;
  final Function(String) onChanged;
  final VoidCallback toggleVisibility;

  const PasswordField({
    required this.obscurePassword,
    required this.onChanged,
    required this.toggleVisibility,
    super.key,
    required this.labelText,
  });
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscurePassword,
      validator:
          (value) =>
              (value == null || value.length < 6)
                  ? 'Enter a valid password'
                  : null,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontFamily: "DopisBold"),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        prefixIcon: const Icon(Icons.lock, color: Color(0xffc47c51)),
        suffixIcon: IconButton(
          icon: Icon(
            obscurePassword ? Icons.visibility : Icons.visibility_off,
            color: Color(0xffc47c51),
          ),
          onPressed: toggleVisibility,
        ),
      ),
    );
  }
}
