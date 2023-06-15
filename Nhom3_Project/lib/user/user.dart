import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/DrawersAdmin.dart';
import 'package:flutter_application_1/pages/Cart.dart';

import 'package:flutter_application_1/pages/Search.dart';
import 'package:flutter_application_1/pages/itempage/product_view.dart';
import 'package:flutter_application_1/provider/product_provider.dart';
import 'package:flutter_application_1/user/Drawers.dart';

import 'package:flutter_application_1/widgets/sing_product.dart';
import 'package:provider/provider.dart';

class roleUser extends StatefulWidget {
  roleUser({super.key});

  @override
  State<roleUser> createState() => _roleUserState();
}

class _roleUserState extends State<roleUser> {
  // final user = FirebaseAuth.instance.currentUser;
  late ProductProvider productProvider;
  Widget _productClock(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Product Clock",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Search(search: productProvider.getProductDataList),
                    ),
                  );
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getProductDataList.map(
              (productData) {
                return TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductView(
                          productPrice: productData.productPrice,
                          productImage: productData.productImage,
                          productName: productData.productName,
                        ),
                      ),
                    );
                  },
                  child: SingalProduct(
                    productPrice: productData.productPrice,
                    productImage: productData.productImage,
                    productName: productData.productName,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _productShoe(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Product Shoe ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Search(search: productProvider.getProductShoeList),
                    ),
                  );
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getProductShoeList.map(
              (productShoeData) {
                return TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductView(
                          productPrice: productShoeData.productPrice,
                          productImage: productShoeData.productImage,
                          productName: productShoeData.productName,
                        ),
                      ),
                    );
                  },
                  child: SingalProduct(
                    productPrice: productShoeData.productPrice,
                    productImage: productShoeData.productImage,
                    productName: productShoeData.productName,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fatchProductData();

    productProvider.fatchProductShoeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    return Scaffold(
      drawer: Drawers(),
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getAllSearch,
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 17,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cart(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.shop,
                  color: Colors.black,
                  size: 17,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://images.squarespace-cdn.com/content/v1/5b35b18af93fd4d75e591f4a/1543985895500-98LX8K027J1RWKQWFGAH/HS-Website---Vegetable-Products.jpg?format=2500w"),
                ),
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 130),
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "vegi",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      shadows: [
                                        BoxShadow(
                                          color: Colors.green,
                                          blurRadius: 18,
                                          offset: Offset(3, 3),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            _productClock(context),
            _productShoe(context),
          ],
        ),
      ),
    );
  }
}
