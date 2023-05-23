// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_doan/components/pages/Drawers.dart';
import 'package:flutter_doan/components/widgets/HeaderWidget.dart';
import 'package:flutter_doan/components/widgets/ItemClothesWidget.dart';
import 'package:flutter_doan/components/widgets/ItemShoeWidget.dart';

class CategoryClothes extends StatelessWidget {
  const CategoryClothes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawers(),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView(
          children: [
            const HeaderWidget(),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 20,
                left: 10,
                bottom: 10,
              ),
              child: const Text(
                "Products Clothes",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const ItemClothesWidget(),
          ],
        ),
      ),
    );
  }
}
