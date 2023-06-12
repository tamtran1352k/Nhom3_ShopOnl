import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/DrawersAdmin.dart';
import 'package:flutter_application_1/pages/BestRatedItem.dart';
import 'package:flutter_application_1/pages/Category.dart';
import 'package:flutter_application_1/user/Drawers.dart';
import 'package:flutter_application_1/pages/Products.dart';
import 'package:flutter_application_1/pages/Search.dart';
import 'package:flutter_application_1/widgets/BestItemWidget.dart';
import 'package:flutter_application_1/widgets/CategoryWidget.dart';
import 'package:flutter_application_1/widgets/HeaderWidget.dart';
import 'package:flutter_application_1/widgets/ProductsWidget.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  DrawersAdmin(),
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
