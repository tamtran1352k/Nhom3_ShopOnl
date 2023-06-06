import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/user.dart';
import 'home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return HomePage();
          }
          else if(snapshot.hasData){
             return roleUser();
          }

          // user is NOT logged in
          else {
            return LoginPage();
          }
        },
      ),
    );
  }
}