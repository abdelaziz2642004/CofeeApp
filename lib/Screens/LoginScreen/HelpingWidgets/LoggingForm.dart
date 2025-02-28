import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  String _emailOrUsername = '';
  String _password = '';
  bool _obscurePassword = true;
  bool _isLoading = false;

  void signIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      //log in :D

      String input = _emailOrUsername!.trim();
      try {
        if (!input.contains('@')) {
          final snapshot =
              await FirebaseFirestore.instance
                  .collection('UserNames')
                  .doc(input)
                  .get();

          if (snapshot.exists) {
            input = snapshot.data()!['email'];
          }
        }

        final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: input,
          password: _password!.trim(),
        );
      } catch (e) {
        // print(e);
        _showErrorDialog(e.toString());
      }
    }
  }

  void _showErrorDialog(String message) {
    if (!mounted) return; // Check if the widget is still mounted
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text('Login Failed'),
            content: Text(message),
            actions: [
              TextButton(
                child: const Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailorUsernameField(onChanged: (value) => _emailOrUsername = value),
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
