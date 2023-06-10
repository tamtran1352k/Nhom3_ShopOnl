import 'package:firebase_uploading/screens/login.dart';
import 'package:flutter/material.dart';

class DrawerSide extends StatelessWidget {
  // Widget listTile({required String title, required IconData iconData, required Function onTap}) {
  //   return ListTile(
  //     onTap: onTap(),
  //     leading: Icon(
  //       iconData,
  //       size: 32,
  //     ),
  //     title: Text(
  //       title,
  //       style: TextStyle(color: Colors.amber),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 100,
        color: Colors.blue,
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 43,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.yellow,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome Guest"),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        height: 30,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // listTile(title: "Home", iconData: Icons.home),
          ],
        ),
      ),
    );
  }
}
