import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String email;
  final String password;

  const Profile({Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (user != null)
              Column(
                children: [
                  Text('Name: ${user!.displayName}'),
                  Text('Email: ${widget.email}'), // Use the passed email
                  Text(
                      'Password: ${widget.password}'), // Use the passed password
                  Text('UID: ${user!.uid}'),
                ],
              ),
            if (user == null) Text('User not logged in.'),
            ElevatedButton(
              onPressed: () {
                if (user != null) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('User Email'),
                        content: Text('Email: ${user!.email}'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Show Email'),
            ),
          ],
        ),
      ),
    );
  }
}
