import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/login.dart';

class RegisterAdmin extends StatefulWidget {
  const RegisterAdmin({Key? key}) : super(key: key);

  @override
  State<RegisterAdmin> createState() => _RegisterAdminState();
}

class _RegisterAdminState extends State<RegisterAdmin> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _roleController = TextEditingController();

  Future<void> _registerAdmin() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    String role = _roleController.text;
    String confirm = _confirmPasswordController.text;

    if (password != confirm) {
      // Password does not match confirm password
      print('Password does not match confirm password');
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('user').add({
        'email': email,
        'password': password,
        'role': role,
      });
      // Registration successful
      print('Registration successful');
    } catch (e) {
      // Registration failed
      print('Registration failed: $e');
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _roleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Admin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
            ),
            TextField(
              controller: _roleController,
              decoration: const InputDecoration(labelText: 'Role'),
            ),
            ElevatedButton(
              onPressed: _registerAdmin,
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
