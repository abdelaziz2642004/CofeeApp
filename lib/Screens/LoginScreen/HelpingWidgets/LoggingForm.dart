import 'package:flutter/material.dart';
import 'package:prj/Screens/HomeScreen/HomeScreen.dart';
import 'package:prj/Screens/LoginScreen/HelpingWidgets/EmailField.dart';
import 'package:prj/Screens/LoginScreen/HelpingWidgets/passwordField.dart';
import 'package:prj/Screens/LoginScreen/HelpingWidgets/signInButton.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _obscurePassword = true;
  bool _isLoading = false;

  void signIn() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      //log in :D
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailField(onChanged: (value) => _email = value),
          const SizedBox(height: 20),
          PasswordField(
            obscurePassword: _obscurePassword,
            onChanged: (value) => _password = value,
            toggleVisibility:
                () => setState(() => _obscurePassword = !_obscurePassword),
            labelText: "Password",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed:
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => const Homescreen()),
                    ),
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Color(0xffc47c51),
                    fontFamily: "DopisBold",
                  ),
                ),
              ),
            ],
          ),
          SignButton(isLoading: _isLoading, onPressed: signIn, type: "In"),
        ],
      ),
    );
  }
}
