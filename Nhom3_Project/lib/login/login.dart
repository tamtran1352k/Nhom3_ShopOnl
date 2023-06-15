import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/registeradmin.dart';
import 'package:flutter_application_1/crud/home_page.dart';
import 'package:flutter_application_1/home_page.dart';

import 'package:flutter_application_1/main.dart';

import 'package:flutter_application_1/user/register.dart';
import 'package:flutter_application_1/user/user.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('user');

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  bool _passwordVisible = false;

  Future<void> _signInButton() async {
    String email = _emailTextController.text.trim();
    String password = _passwordTextController.text;

    // Check if email or password is empty
    if (email.isEmpty || password.isEmpty) {
      showErrorMessage('empty-fields');
      return;
    }

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('user')
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();

    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      if (querySnapshot.size > 0) {
        String role = querySnapshot.docs[0]['role'];
        if (role.toLowerCase() == 'admin') {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          Navigator.pop(context);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeAdmin()),
          );
        } else if (role.toLowerCase() == 'user') {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => roleUser()),
          );
        }
      } else {
        // pop the loading circle
        Navigator.pop(context);
        showErrorMessage('incorrect-credentials');
      }
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String errorCode) {
    String errorMessage = '';
    switch (errorCode) {
      case 'invalid-email':
        errorMessage = 'Invalid email address.';
        break;
      case 'user-disabled':
        errorMessage = 'User account has been disabled.';
        break;
      case 'user-not-found':
        errorMessage = 'User not found.';
        break;
      case 'wrong-password':
        errorMessage = 'Wrong password.';
        break;
      case 'empty-fields':
        errorMessage = 'Please enter both email and password.';
        break;
      case 'incorrect-credentials':
        errorMessage = 'Incorrect email or password.';
        break;
      default:
        errorMessage = 'Login failed. Please check your credentials.';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void registeradmin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterAdmin()),
    );
  }

  void register() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Icon(
              Icons.lock,
              size: 100,
            ),
            SizedBox(height: 50),
            Text(
              "Wellcome back you\'ve been missed!",
              style: TextStyle(color: Colors.grey[700], fontSize: 20),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: _emailTextController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 25),
            TextFormField(
              controller: _passwordTextController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
              obscureText: !_passwordVisible,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: ElevatedButton(
                    onPressed: _signInButton,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: ElevatedButton(
                    onPressed: register,
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
