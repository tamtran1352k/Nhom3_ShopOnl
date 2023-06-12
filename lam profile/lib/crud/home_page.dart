// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/crud/add_list_page.dart';
import 'package:flutter_application_1/crud/list_account_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('To List Account'),
            IconButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Addlist(),
                  ),
                )
              },
              icon: const Icon(
                Icons.add,
                size: 35,
                color: Colors.lightGreen,
              ),
            )
          ],
        ),
      ),
      body: ListAccountPage(),
    );
  }
}
