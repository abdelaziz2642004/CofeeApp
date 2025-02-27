import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:prj/Screens/LoginScreen/HelpingWidgets/LoggingForm.dart';
import 'package:prj/Screens/SignUpScreen/signUpScreen.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key, required this.guestMode});

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
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: "DopisBold",
                    ),
                  ),
                  const SizedBox(height: 20),
                  const LoginForm(),

                  TextButton(
                    onPressed:
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (ctx) => SignupScreen(guestMode: guestMode),
                          ),
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 83, 83, 83),
                            fontFamily: "DopisBold",
                          ),
                        ),
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Color(0xffc47c51),
                            fontFamily: "DopisBold",
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: guestMode,
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
