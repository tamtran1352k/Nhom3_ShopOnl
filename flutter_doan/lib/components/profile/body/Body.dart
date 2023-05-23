import 'package:flutter/material.dart';
import 'package:flutter_doan/components/profile/body/ProfilePic.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfilePic(),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: const Color(0xFFF5F6F9),
            ),
            onPressed: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.people,
                  color: Colors.grey,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    "My account",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: const Color(0xFFF5F6F9),
            ),
            onPressed: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.people,
                  color: Colors.grey,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    "My account",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: const Color(0xFFF5F6F9),
            ),
            onPressed: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.people,
                  color: Colors.grey,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    "My account",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: const Color(0xFFF5F6F9),
            ),
            onPressed: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.people,
                  color: Colors.grey,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    "My account",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
