import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 115,
          width: 115,
          child: Icon(
            Icons.account_circle,
            size: 80,
          ),
        ),
      ],
    );
  }
}
