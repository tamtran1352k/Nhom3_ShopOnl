import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/registeradmin.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('users');

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
      print('Đăng nhập thành công');
    } else {
      // Login failed
      print('Đăng nhập thất bại');
    }
  }

  void registeradmin() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterAdmin()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Login Admin'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _login,
                  child: Text('Login'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: registeradmin,
                  child: Text('Register Admin'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
