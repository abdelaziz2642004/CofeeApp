import 'package:flutter/material.dart';

class customPasswordfield extends StatelessWidget {
  final String? errorText;

  customPasswordfield({
    this.errorText,
    required this.onChanged,
    required this.obsecurePassword,
    required this.onPressed,
    required this.validator,
    required this.labelText,
  });
  final void Function(String) onChanged;
  //      onChanged: (value) => _password = value, // will be passed
  final bool obsecurePassword;
  // obscureText: obsecurePassword1, // will be passed

  final void Function() onPressed;

  //              () => setState(
  // () => _obscurePassword1 = !_obscurePassword1,
  //   ), // will be passed

  final String? Function(String?) validator;

  //  (value) {
  //       String pattern =
  //           r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$';
  //       RegExp regex = RegExp(pattern);
  //       if (value == null || value.isEmpty) {
  //         return 'Password cannot be empty';
  //       }
  //       if (value.length < 6 || !regex.hasMatch(value)) {
  //         return 'Password must be at least 6 characters \nand it must contain \nuppercase, lowercase \nnumber, and special character';
  //       }

  //       return null;
  //     } // will be passed

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged, // will be passed
      obscureText: obsecurePassword, // will be passed
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontFamily: "DopisBold"),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        prefixIcon: const Icon(Icons.lock, color: Color(0xffc47c51)),
        suffixIcon: IconButton(
          icon: Icon(
            obsecurePassword ? Icons.visibility : Icons.visibility_off,
            color: Color(0xffc47c51),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
