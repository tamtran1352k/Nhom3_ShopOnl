import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/DrawersAdmin.dart';
import 'package:flutter_application_1/pages/BestRatedItem.dart';
import 'package:flutter_application_1/pages/Category.dart';
import 'package:flutter_application_1/pages/Products.dart';
import 'package:flutter_application_1/pages/Search.dart';
import 'package:flutter_application_1/user/Drawers.dart';
import 'package:flutter_application_1/widgets/BestItemWidget.dart';
import 'package:flutter_application_1/widgets/CategoryWidget.dart';
import 'package:flutter_application_1/widgets/HeaderWidget.dart';
import 'package:flutter_application_1/widgets/ProductsWidget.dart';

class roleUser extends StatelessWidget {
  roleUser({super.key});
  // final user = FirebaseAuth.instance.currentUser;

  // // sign user out method
  // void signUserOut(BuildContext context) {
  //   FirebaseAuth.instance.signOut();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  Drawers(),
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
