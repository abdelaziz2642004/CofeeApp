import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:prj/Screens/SignUpScreen/HelpingWIdgets/SIgnUpForm.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key, required this.guestMode});
  final void Function() guestMode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/JSON/Welcome.json',
                    height: 200,
                    repeat: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Create an Account',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: "DopisBold",
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SignupForm(),
                  const SizedBox(height: 20),

                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 83, 83, 83),
                            fontFamily: "DopisBold",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "Sign in",
                          style: TextStyle(
                            color: Color(0xffc47c51),
                            fontFamily: "DopisBold",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      guestMode();
                    },
                    child: const Text(
                      "Continue as guest? ",
                      style: TextStyle(
                        color: Color(0xffc47c51),
                        fontFamily: "DopisBold",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
