import 'package:flutter/material.dart';
import 'package:flutter_doan/components/pages/Drawers.dart';
import 'package:flutter_doan/components/profile/body/Body.dart';
import 'package:flutter_doan/components/widgets/HeaderWidget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawers(),
      body: Padding(
        padding: EdgeInsets.only(top: 5),
        child: ListView(
          children: [
            const HeaderWidget(),
            Body(),
          ],
        ),
      ),
    );
  }
}
