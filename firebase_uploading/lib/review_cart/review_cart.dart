import 'package:firebase_uploading/widget/search_item.dart';
import 'package:flutter/material.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("Title amount"),
        subtitle: Text(
          "\$ 170.00",
          style: TextStyle(color: Colors.green[900]),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text("Submit"),
            color: Colors.black54,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {},
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Review Cart",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          SearchItem(
            isBool: true,
          ),
          SearchItem(
            isBool: true,
          ),
          SearchItem(
            isBool: true,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
