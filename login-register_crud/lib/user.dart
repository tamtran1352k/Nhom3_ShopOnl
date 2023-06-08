import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';

class roleUser extends StatelessWidget {
  roleUser({super.key});
  final user = FirebaseAuth.instance.currentUser;

  // sign user out method
  void signUserOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {
            Navigator.pop(context),
          },
          icon: Icon(Icons.logout),
        ),
      ),
      body: Center(
        child: Text('djasjdasjkdjkasd'),
      ),
    );
  }
}
