import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/DrawersAdmin.dart';
import 'package:flutter_application_1/pages/Cart.dart';
import 'package:flutter_application_1/pages/itempage/product_view.dart';
import 'package:flutter_application_1/provider/product_provider.dart';

import 'package:flutter_application_1/user/Drawers.dart';

import 'package:flutter_application_1/pages/Search.dart';

import 'package:flutter_application_1/widgets/sing_product.dart';
import 'package:provider/provider.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
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
      drawer: DrawersAdmin(),
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
                  CupertinoIcons.shopping_cart,
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
                      "https://luxevn.com/wp-content/uploads/2013/12/1-4.jpg"),
                ),
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
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
