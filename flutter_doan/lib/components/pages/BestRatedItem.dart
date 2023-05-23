// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BestRatedItem extends StatelessWidget {
  const BestRatedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20, left: 15),
      child: Text(
        "Best rated item",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
    );
  }
}
