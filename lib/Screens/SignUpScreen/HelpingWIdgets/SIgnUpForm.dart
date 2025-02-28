import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:prj/Screens/LoginScreen/HelpingWidgets/EmailField.dart';
import 'package:prj/Screens/LoginScreen/HelpingWidgets/passwordField.dart';
import 'package:prj/Screens/LoginScreen/HelpingWidgets/signInButton.dart';
import 'package:prj/Screens/SignUpScreen/HelpingWIdgets/ImagePIcker.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  String? _username = '';
  String? _fullName = '';
  String _email = '';
  String _password = '';
  bool _obscurePassword1 = true;
  bool _obscurePassword2 = true;
  String? _usernameError;
  String? _emailError;
  File? _selectedImage;

  bool _isLoading = false;

  Future<String> uploadImageToCloudinary(
    File imageFile,
    UserCredential user,
  ) async {
    final url = Uri.parse(
      'https://api.cloudinary.com/v1_1/dv0opvwfu/image/upload',
    );

    var request =
        http.MultipartRequest('POST', url)
          ..fields['upload_preset'] = 'UsersPics'
          ..fields['public_id'] = user.user!.uid
          // Set a custom name
          ..files.add(
            await http.MultipartFile.fromPath(
              'file',
              imageFile.path,
              contentType: MediaType.parse(
                lookupMimeType(imageFile.path) ?? 'image/jpeg',
              ),
            ),
          );

    var response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await http.Response.fromStream(response);
      return jsonDecode(responseData.body)['secure_url'];
    } else {
      throw Exception('Failed to upload image: ${response.statusCode}');
    }
  }

  void _showSuccessPopup() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/sent.json',
                    width: 300, // Lottie animation
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Account created successfully! Please verify your email.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      // color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
    // Navigator.of(context).pop(); nope
  }

  Future<void> signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _emailError = null;
        _usernameError = null;
        _isLoading = true;
      });

      // print("I'm here");

      var usernameSnapshot =
          await FirebaseFirestore.instance
              .collection('UserNames')
              .doc(_username)
              .get();

      if (usernameSnapshot.exists) {
        setState(() {
          _usernameError = 'Username already exists';
          _isLoading = false;
        });
        return;
      }

      try {
        final userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: _email.trim(),
              password: _password.trim(),
            );
        // print(userCredential.user!.email);
        // print("i'm here");

        String imageUrl = await uploadImageToCloudinary(
          _selectedImage!,
          userCredential,
        ); // in order to await a function , --> Future<type>
        print("i'm here $imageUrl");

        await FirebaseFirestore.instance
            .collection('Users')
            .doc(userCredential.user!.uid)
            .set({
              'username': _username!.trim(),
              'fullname': _fullName,
              'email': _email.trim(),

              'imageUrl': imageUrl,
            });

        await FirebaseFirestore.instance
            .collection('UserNames')
            .doc(_username)
            .set({
              'username': _username!.trim(),
              'fullname': _fullName,
              'email': _email.trim(),
              'id': userCredential.user!.uid,
            });

        setState(() {
          _isLoading = false;
        });
        // Show success popup
        _showSuccessPopup();
      } catch (e) {
        if (!context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('An error occurred: ${e.toString()}')),
          );
          setState(() => _isLoading = false);
        }

        // send email verification , will still see if I will include this
        // await userCredential.user!.sendEmailVerification();
        // I need to rehost my old website again and it also need flutter blaze
        // obviously there are other solutions for hosting but I don't have time unfortunately

        setState(() => _isLoading = false);
      }
    }
  }

  void _checkUsername(String userName) async {
    if (userName.isEmpty) {
      setState(() {
        _usernameError = null; // Clear error
      });
      return;
    }

    var usernameSnapshot =
        await FirebaseFirestore.instance
            .collection('UserNames')
            .doc(userName)
            .get();

    setState(() {
      _usernameError =
          usernameSnapshot.exists ? 'Username already exists' : null;
    });
  }

  Future<void> _checkEmail(String email) async {
    // Check if the email exists in the Users collection
    var emailSnapshot =
        await FirebaseFirestore.instance
            .collection('Users')
            .where('email', isEqualTo: email.trim())
            .get();

    setState(() {
      _emailError =
          emailSnapshot.docs.isNotEmpty ? 'Email already exists' : null;
    });
  }

  void pickImage(File img) {
    setState(() {
      _selectedImage = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          UserImagePicker(onPickImage: pickImage),

          TextFormField(
            onChanged: _checkEmail,

            validator: (value) {
              if (value == null ||
                  !RegExp(
                    r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                  ).hasMatch(value)) {
                return 'Enter a valid Email';
              }
              _email = value;

              return null;
            },
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(fontFamily: "DopisBold"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              prefixIcon: const Icon(Icons.email, color: Color(0xffc47c51)),
              errorText: _emailError,
            ),
          ),

          const SizedBox(height: 20),

          TextFormField(
            validator: (value) {
              if (value == null)
                return null;
              else if (value.length < 4)
                return "Username must be 4 or more characters :D";

              _username = value;
            },
            onChanged: _checkUsername,
            decoration: InputDecoration(
              labelText: 'Username',
              labelStyle: TextStyle(fontFamily: "DopisBold"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              prefixIcon: const Icon(Icons.email, color: Color(0xffc47c51)),
              errorText: _usernameError,
            ),
          ),
          const SizedBox(height: 20),

          TextFormField(
            onChanged: (value) => _password = value,
            obscureText: _obscurePassword1,
            validator: (value) {
              String pattern =
                  r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$';
              RegExp regex = RegExp(pattern);
              if (value == null || value.isEmpty) {
                return 'Password cannot be empty';
              }
              if (value.length < 6 || !regex.hasMatch(value)) {
                return 'Password must be at least 6 characters \nand it must contain \nuppercase, lowercase \nnumber, and special character';
              }

              return null;
            },
            decoration: InputDecoration(
              labelText: "Password",
              labelStyle: TextStyle(fontFamily: "DopisBold"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              prefixIcon: const Icon(Icons.lock, color: Color(0xffc47c51)),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword1 ? Icons.visibility : Icons.visibility_off,
                  color: Color(0xffc47c51),
                ),
                onPressed:
                    () =>
                        setState(() => _obscurePassword1 = !_obscurePassword1),
              ),
            ),
          ),

          const SizedBox(height: 20),

          TextFormField(
            obscureText: _obscurePassword2,
            validator: (value) {
              if (value == '' || value == null)
                return 'Password can not be empty';
              else if (value != _password)
                return 'Passwords do not match';
              String pattern =
                  r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$';
              RegExp regex = RegExp(pattern);
              if (!regex.hasMatch(value)) return 'Incorrect format.';
            },
            decoration: InputDecoration(
              labelText: "Confirm Password",
              labelStyle: TextStyle(fontFamily: "DopisBold"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              prefixIcon: const Icon(Icons.lock, color: Color(0xffc47c51)),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword2 ? Icons.visibility : Icons.visibility_off,
                  color: Color(0xffc47c51),
                ),
                onPressed:
                    () =>
                        setState(() => _obscurePassword2 = !_obscurePassword2),
              ),
            ),
          ),
          const SizedBox(height: 20),

          TextFormField(
            onChanged: (value) => _fullName = value,
            validator: (val) {
              if (val == '') return 'Field cannot be empty';
            },
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
