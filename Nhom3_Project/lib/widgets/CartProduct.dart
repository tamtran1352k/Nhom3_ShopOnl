import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/product_provider.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatefulWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final int index;
  late int productQuantity;
  CartProduct(
      {required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productQuantity,
      required this.index});

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  late ProductProvider productProvider;
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
    productProvider = Provider.of<ProductProvider>(context);
    int totalPrice = getTotalPrice();

    return Container(
      height: 150,
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 130,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.productImage),
                    ),
                  ),
                ),
                Container(
                  height: 140,
                  width: 200,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.productName),
                              IconButton(
                                onPressed: () {
                                  productProvider.deleteProduct(widget.index);
                                },
                                icon: Icon(
                                  Icons.delete,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "\$ $totalPrice",
                          style: TextStyle(
                            color: Color(0xff9b96d6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 130,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
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
                                    color: Colors.red),
                              ),
                              IconButton(
                                onPressed: _incrementCount,
                                icon: Icon(Icons.add),
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
