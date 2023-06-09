// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemBottom extends StatelessWidget {
  const ItemBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "ToTal:",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "\$55",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {},
                child: const Icon(CupertinoIcons.shopping_cart)),
          ],
        ),
      ),
    );
  }
}
