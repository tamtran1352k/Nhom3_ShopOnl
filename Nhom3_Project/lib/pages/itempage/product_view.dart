import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/DrawersAdmin.dart';
import 'package:flutter_application_1/pages/Count.dart';
import 'package:flutter_application_1/widgets/ItemBottom.dart';

import '../../widgets/HeaderWidget.dart';

class ProductView extends StatefulWidget {
  String productImage;
  String productName;
  int productPrice;

  ProductView({
    required this.productImage,
    required this.productName,
    required this.productPrice,
  });

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int countValue = 1;

  void _incrementCount() {
    setState(() {
      countValue++;
    });
  }

  void _decrementCount() {
    setState(() {
      if (countValue > 0) {
        countValue--;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Count cannot be less than zero."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    });
  }

  int getTotalPrice() {
    return widget.productPrice * countValue;
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = getTotalPrice();

    return Scaffold(
      drawer: DrawersAdmin(),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView(
          children: [
            HeaderWidget(),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.network(
                widget.productImage ?? "",
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 50,
                          bottom: 50,
                        ),
                        child: Row(
                          children: [
                            Text(
                              widget.productName,
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: _decrementCount,
                            icon: Icon(Icons.remove),
                            color: Colors.blue,
                          ),
                          Text(
                            countValue.toString(),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: _incrementCount,
                            icon: Icon(Icons.add),
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "Với chất liệu cao cấp chuyên dụng tạo cảm giác thoải mái cho bạn trong suốt quá trình vận động, mang lại một phong cách thật thời thượng mỗi khi xuống phố.",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Total:",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "\$ $totalPrice",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const ItemBottom(),
    );
  }
}
