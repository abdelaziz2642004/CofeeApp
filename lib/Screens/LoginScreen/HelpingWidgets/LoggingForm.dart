import 'package:flutter/material.dart';
import 'package:prj/Screens/HomeScreen/HomeScreen.dart';
import 'package:prj/Screens/LoginScreen/HelpingWidgets/EmailField.dart';
import 'package:prj/Screens/LoginScreen/HelpingWidgets/passwordField.dart';
import 'package:prj/Screens/LoginScreen/HelpingWidgets/signInButton.dart';
import 'package:prj/Screens/LoginScreen/LoginService/LoginService.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final LoginService loginService;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginService = LoginService(context: context, rebuild: setState);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginService.formKey,
      child: Column(
        children: [
          EmailorUsernameField(
            onChanged: (value) => loginService.emailOrUsername = value,
          ),
          const SizedBox(height: 20),
          PasswordField(
            obscurePassword: loginService.obscurePassword,
            onChanged: (value) => loginService.password = value,
            toggleVisibility:
                () => setState(
                  () =>
                      loginService.obscurePassword =
                          !loginService.obscurePassword,
                ),
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
          SignButton(
            isLoading: loginService.isLoading,
            onPressed: loginService.signIn,
            type: "In",
          ),
        ],
      ),
    );
  }
}
