import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/login/login.dart';

class Addlist extends StatefulWidget {
  const Addlist({Key? key}) : super(key: key);

  @override
  State<Addlist> createState() => _AddlistState();
}

class _AddlistState extends State<Addlist> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String _selectedRole = 'admin'; // Default value is 'admin'
  bool _passwordVisible = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<String> _roles = ['admin', 'user']; // Available role options

  Future<void> _registerAdmin() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text;
    String confirm = _confirmPasswordController.text;
    String role = _selectedRole;

    if (password != confirm) {
      _showSnackBar('Password does not match confirm password');
      return;
    }

    if (!email.contains('@')) {
      _showSnackBar('Invalid email format');
      return;
    }

    if (password.length < 6) {
      _showSnackBar('Password should be at least 6 characters long');
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('user').add({
        'email': email,
        'password': password,
        'role': role,
      });
      _showSnackBar('Registration successful');
    } catch (e) {
      _showSnackBar('Registration failed: $e');
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        _showSnackBar('Registration successful');
        // Navigate to the home page or any other desired screen
      }
    } catch (e) {
      _showSnackBar('Registration failed: $e');
    }
    Navigator.pop(context);
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  clearText() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
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
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
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
            TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
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
            DropdownButtonFormField<String>(
              value: _selectedRole,
              items: _roles.map((String role) {
                return DropdownMenuItem<String>(
                  value: role,
                  child: Text(role),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRole = newValue!;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Role',
              ),
            ),
            ElevatedButton(
              onPressed: _registerAdmin,
              child: const Text('Register Admin'),
            ),
          ],
        ),
      ),
    );
  }
}
