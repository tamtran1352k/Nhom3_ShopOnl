import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  bool isBool = false;
  SearchItem({required this.isBool});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  child: Center(
                    child: Image.network(
                        "https://images.squarespace-cdn.com/content/v1/5b35b18af93fd4d75e591f4a/1543985895500-98LX8K027J1RWKQWFGAH/HS-Website---Vegetable-Products.jpg?format=2500w"),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "50\$/50 gram",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      isBool == false
                          ? Container(
                              margin: EdgeInsets.only(right: 15),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "50gram",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      size: 20,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Text("50gram")
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  padding: isBool == false
                      ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : EdgeInsets.only(left: 15, right: 15),
                  child: isBool == false
                      ? Container(
                          height: 25,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.amber[200],
                                  size: 20,
                                ),
                                Text(
                                  "Add",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.black54,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 25,
                              width: 70,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.amber[200],
                                      size: 20,
                                    ),
                                    Text(
                                      "Add",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
        isBool == false
            ? Container()
            : Divider(
                height: 1,
                color: Colors.black45,
              ),
      ],
    );
  }
}
