import 'dart:io';

import 'package:flutter/material.dart';
import 'package:prj/Screens/LoginScreen/HelpingWidgets/EmailField.dart';
import 'package:prj/Screens/LoginScreen/HelpingWidgets/passwordField.dart';
import 'package:prj/Screens/LoginScreen/HelpingWidgets/signInButton.dart';
import 'package:prj/Screens/SignUpScreen/HelpingWIdgets/ImagePIcker.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _fullName = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  bool _obscurePassword1 = true;
  bool _obscurePassword2 = true;

  bool _isLoading = false;

  void signUp() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isLoading = false);
      });
    }
  }

  void _pickedImage(File image) {
    // Handle picked image (e.g., upload it or store it)
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          UserImagePicker(onPickImage: _pickedImage),

          EmailField(onChanged: (value) => _email = value),

          const SizedBox(height: 20),

          TextFormField(
            onChanged: (value) => _fullName = value,
            decoration: InputDecoration(
              labelText: 'Username',
              labelStyle: TextStyle(fontFamily: "DopisBold"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              prefixIcon: const Icon(Icons.email, color: Color(0xffc47c51)),
            ),
          ),
          const SizedBox(height: 20),
          PasswordField(
            obscurePassword: _obscurePassword1,
            onChanged: (value) => _password = value,
            toggleVisibility:
                () => setState(() => _obscurePassword1 = !_obscurePassword1),
            labelText: "Password",
          ),
          const SizedBox(height: 20),
          PasswordField(
            obscurePassword: _obscurePassword2,
            onChanged: (value) => _confirmPassword = value,
            toggleVisibility:
                () => setState(() => _obscurePassword2 = !_obscurePassword2),
            labelText: "Confirm Password",
          ),
          const SizedBox(height: 20),
          TextFormField(
            onChanged: (value) => _fullName = value,
            decoration: InputDecoration(
              labelText: 'Full Name',
              labelStyle: TextStyle(fontFamily: "DopisBold"),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              prefixIcon: const Icon(Icons.email, color: Color(0xffc47c51)),
            ),
          ),
          const SizedBox(height: 20),

          SignButton(isLoading: _isLoading, onPressed: signUp, type: "Up"),
        ],
      ),
    );
  }
}
