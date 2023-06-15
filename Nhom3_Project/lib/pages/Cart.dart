import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/product_provider.dart';
import 'package:flutter_application_1/widgets/CartProduct.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  double calculateTotalPrice(ProductProvider productProvider) {
    double totalPrice = 0.0;
    for (var cartItem in productProvider.getCartModelList) {
      if (cartItem.productQuantity > 0) {
        totalPrice += cartItem.productPrice * cartItem.productQuantity;
      }
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    double totalPrice =
        calculateTotalPrice(productProvider); // Update this line

    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        padding: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: MaterialButton(
          onPressed: () {},
          child: Text(
            "Buy",
            style: TextStyle(color: Colors.white),
          ),
          color: Color(0xff746bc9),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productProvider.getCartModelListLength,
              itemBuilder: (context, index) => CartProduct(
                index: index,
                productImage:
                    productProvider.getCartModelList[index].productImage,
                productName:
                    productProvider.getCartModelList[index].productName,
                productPrice:
                    productProvider.getCartModelList[index].productPrice,
                productQuantity:
                    productProvider.getCartModelList[index].productQuantity,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Total: \$${totalPrice.toStringAsFixed(2)})',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
