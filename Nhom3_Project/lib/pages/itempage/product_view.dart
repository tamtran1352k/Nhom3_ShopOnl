import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/DrawersAdmin.dart';
import 'package:flutter_application_1/pages/Cart.dart';

import 'package:flutter_application_1/provider/product_provider.dart';

import 'package:provider/provider.dart';

class ProductView extends StatefulWidget {
  final String productImage;
  final String productName;
  final int productPrice;

  ProductView({
    required this.productImage,
    required this.productName,
    required this.productPrice,
  });

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  late ProductProvider productProvider;
  int countValue = 1;

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      drawer: DrawersAdmin(),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView(
          children: [
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ ${widget.productPrice}",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
              GestureDetector(
                  onTap: () {
                    productProvider.getCartData(
                      productName: widget.productName,
                      productImage: widget.productImage,
                      productPrice: widget.productPrice,
                      productQuantity: countValue,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cart(),
                      ),
                    );
                  },
                  child: const Icon(
                    CupertinoIcons.shopping_cart,
                    size: 30,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
