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

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;
  Future<void> _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('user')
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();

    if (querySnapshot.size > 0) {
      // Login successful
      String role = querySnapshot.docs[0]['role'];
      if (role == 'admin') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeAdmin()));
      } else if (role == 'user') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => roleUser()),
        );
      } else {
        print('Unknown role: $role');
      }
    } else {
      // Login failed
      print('Đăng nhập thất bại');
    }
  }

  void registeradmin() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterAdmin()));
  }

  void register() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterPage()));
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
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 25),
            TextFormField(
              controller: _passwordController,
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
                    onPressed: _login,
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
