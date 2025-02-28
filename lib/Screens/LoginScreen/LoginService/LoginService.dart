import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginService {
  final formKey = GlobalKey<FormState>();
  String emailOrUsername = '';
  String password = '';
  bool obscurePassword = true;
  bool isLoading = false;

  final void Function(void Function()) rebuild; // rebuild the parent widget :D
  final BuildContext context; // show a successful dialog

  LoginService({required this.context, required this.rebuild});

  void signIn() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      rebuild(() {});
      //log in :D

      String input = emailOrUsername!.trim();
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
          password: password!.trim(),
        );
        isLoading = false;
        rebuild(() {});
      } catch (e) {
        // print(e);
        _showErrorDialog(e.toString());
      }
    }
  }

  void _showErrorDialog(String message) {
    if (!context.mounted) return; // Check if the widget is still mounted
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
}
