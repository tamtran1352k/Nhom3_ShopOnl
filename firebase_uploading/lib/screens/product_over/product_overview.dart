import 'package:flutter/material.dart';

enum SinginCharacter { fill, ouline }

class ProductOverView extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  ProductOverView(
      {required this.productImage,
      required this.productName,
      required this.productPrice});

  @override
  State<ProductOverView> createState() => _ProductOverViewState();
}

class _ProductOverViewState extends State<ProductOverView> {
  SinginCharacter _character = SinginCharacter.fill;
  Widget bonntonNavigatorBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required String title,
    required IconData iconData,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 17,
              color: iconColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bonntonNavigatorBar(
            iconColor: Colors.grey,
            backgroundColor: Colors.black54,
            color: Colors.white70,
            title: "Add to list",
            iconData: Icons.favorite,
          ),
          bonntonNavigatorBar(
            iconColor: Colors.white70,
            backgroundColor: Colors.amber,
            color: Colors.black54,
            title: "Go to cart",
            iconData: Icons.shop_outlined,
          ),
        ],
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black54),
        title: Text(
          "Product",
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text(widget.productName),
                    subtitle: Text("\$50"),
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.all(40),
                    child: Image.network(
                      widget.productImage ?? "",
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      "Available options",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green[700],
                            ),
                            Radio(
                              value: SinginCharacter.fill,
                              groupValue: _character,
                              activeColor: Colors.green[700],
                              onChanged: (value) {
                                setState(() {
                                  _character = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        Text("\$ ${widget.productPrice}"),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 15,
                                color: Colors.amber,
                              ),
                              Text(
                                "add",
                                style: TextStyle(color: Colors.amber),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "About this product",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "This video we cover Product Overview Page Develop  Food Ordering/ Delivery app  using Flutter and Firebase at  Visual Studio Code(VS Code) Having Customer App",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
