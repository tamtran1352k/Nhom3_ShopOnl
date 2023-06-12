import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Count extends StatefulWidget {
  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int _count = 1;
  bool isTrue = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ]),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (_count > 1) {
                          setState(() {
                            _count--;
                          });
                        }
                        if (_count == 1) {
                          setState(() {
                            isTrue = false;
                          });
                        }
                      });
                    },
                    child: const Icon(
                      CupertinoIcons.minus,
                      size: 18,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "$_count",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ]),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _count++;
                      });
                    },
                    child: const Icon(
                      CupertinoIcons.plus,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
