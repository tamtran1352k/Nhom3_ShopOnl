import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/DrawersAdmin.dart';

import 'package:flutter_application_1/user/Drawers.dart';

import 'package:flutter_application_1/pages/Search.dart';

import 'package:flutter_application_1/widgets/HeaderWidget.dart';
import 'package:flutter_application_1/widgets/ProductShoe.dart';

import 'package:flutter_application_1/widgets/Product_T-shirt.dart';
import 'package:flutter_application_1/widgets/ProductsClock.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawersAdmin(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            HeaderWidget(),

            //Products

            ProductClock(),
            ProductTShirt(),
            ProductShoe(),
          ],
        ),
      ),
    );
  }
}
