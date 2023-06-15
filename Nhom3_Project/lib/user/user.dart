import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/DrawersAdmin.dart';

import 'package:flutter_application_1/pages/Search.dart';
import 'package:flutter_application_1/user/Drawers.dart';

import 'package:flutter_application_1/widgets/HeaderWidget.dart';
import 'package:flutter_application_1/widgets/ProductShoe.dart';

import 'package:flutter_application_1/widgets/Product_T-shirt.dart';
import 'package:flutter_application_1/widgets/ProductsClock.dart';

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
      drawer: Drawers(),
      body: ListView(
        children: [
          HeaderWidget(),

          //Products

          ProductClock(),
          ProductTShirt(),
          ProductShoe(),

          //Best rated item
          // BestRatedItem(),
          // BestItemWidget(),
        ],
      ),
    );
  }
}
