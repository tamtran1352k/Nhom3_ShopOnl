import 'package:flutter/material.dart';
import 'package:flutter_application_1/user/Drawers.dart';
import 'package:flutter_application_1/widgets/HeaderWidget.dart';
import 'package:flutter_application_1/widgets/ItemShoeWidget.dart';

class CategoryShoe extends StatelessWidget {
  const CategoryShoe({super.key});

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
                "Products Shoe",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const ItemShoeWidget(),
          ],
        ),
      ),
    );
  }
}
