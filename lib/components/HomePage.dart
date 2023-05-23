// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_doan/components/pages/BestRatedItem.dart';
import 'package:flutter_doan/components/pages/Category.dart';
import 'package:flutter_doan/components/pages/Drawers.dart';
import 'package:flutter_doan/components/pages/Products.dart';
import 'package:flutter_doan/components/widgets/BestItemWidget.dart';
import 'package:flutter_doan/components/widgets/CategoryWidget.dart';
import 'package:flutter_doan/components/widgets/HeaderWidget.dart';
import 'package:flutter_doan/components/pages/Search.dart';
import 'package:flutter_doan/components/widgets/ProductsWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawers(),
      body: ListView(
        children: const [
          HeaderWidget(),

          //search
          Search(),

          //Category
          Category(),
          CategoryWidget(),

          //Products
          Products(),
          ProductsWidget(),

          //Best rated item
          BestRatedItem(),
          BestItemWidget(),
        ],
      ),
    );
  }
}
