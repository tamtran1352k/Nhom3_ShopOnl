// ignore_for_file: unnecessary_import

import 'package:firebase_demozz/pages/add_student_page.dart';
import 'package:firebase_demozz/pages/list_student_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Flutter FireStore CRUD'),
            IconButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddStudentPage(),
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
      body: const ListStudentPage(),
    );
  }
}
