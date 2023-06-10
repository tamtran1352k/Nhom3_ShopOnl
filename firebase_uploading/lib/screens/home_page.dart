import 'package:firebase_uploading/model/product_model.dart';
import 'package:firebase_uploading/provider/product_provider.dart';
import 'package:firebase_uploading/review_cart/review_cart.dart';
import 'package:firebase_uploading/screens/drawer_side.dart';
import 'package:firebase_uploading/screens/product.dart';
import 'package:firebase_uploading/screens/product_over/product_overview.dart';
import 'package:firebase_uploading/widget/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ProductProvider productProvider;
  Widget _singalProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Herbs Seasonings"),
              Text(
                "View all",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getHerbsProductDataList.map(
              (herbsProductData) {
                return TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductOverView(
                          productPrice: herbsProductData.productPrice,
                          productImage: herbsProductData.productImage,
                          productName: herbsProductData.productName,
                        ),
                      ),
                    );
                  },
                  child: SingalProduct(
                    productPrice: herbsProductData.productPrice,
                    productImage: herbsProductData.productImage,
                    productName: herbsProductData.productName,
                  ),
                );
              },
            ).toList(),
            // children: [
            // TextButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => ProductOverView(
            //           productImage:
            //               "https://dosi-in.com/images/detailed/104/dosiin-teeholic-so-mi-tay-ngan-in-la-ma-roman-painting-104954104954.jpg",
            //           productName: "Frech",
            //         ),
            //       ),
            //     );
            //   },
            //   child: SingalProduct(
            //     productImage:
            //         "https://dosi-in.com/images/detailed/104/dosiin-teeholic-so-mi-tay-ngan-in-la-ma-roman-painting-104954104954.jpg",
            //     productName: "Frech",
            //   ),
            // ),

            // ],
          ),
        ),
      ],
    );
  }

  Widget _buildFreshProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Herbs Seasonings"),
              Text(
                "View all",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getFreshProductDataList.map(
              (freshProductData) {
                return TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductOverView(
                          productPrice: freshProductData.productPrice,
                          productImage: freshProductData.productImage,
                          productName: freshProductData.productName,
                        ),
                      ),
                    );
                  },
                  child: SingalProduct(
                    productPrice: freshProductData.productPrice,
                    productImage: freshProductData.productImage,
                    productName: freshProductData.productName,
                  ),
                );
              },
            ).toList(),
            // children: [
            // TextButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => ProductOverView(
            //           productImage:
            //               "https://ae01.alicdn.com/kf/H22ffb71966954b7aa3334894fea86b0cp/2022-LIGE-New-Rose-Gold-Women-Watch-Business-Quartz-Watch-Ladies-Top-Brand-Luxury-Female-Wrist.jpg",
            //           productName: "Frech",
            //         ),
            //       ),
            //     );
            //   },
            //   child: SingalProduct(
            //     productImage:
            //         "https://ae01.alicdn.com/kf/H22ffb71966954b7aa3334894fea86b0cp/2022-LIGE-New-Rose-Gold-Women-Watch-Business-Quartz-Watch-Ladies-Top-Brand-Luxury-Female-Wrist.jpg",
            //     productName: "Frech",
            //   ),
            // ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => ProductOverView(
            //           productImage:
            //               "https://dosi-in.com/images/detailed/104/dosiin-teeholic-so-mi-tay-ngan-in-la-ma-roman-painting-104954104954.jpg",
            //           productName: "Frech",
            //         ),
            //       ),
            //     );
            //   },
            //   child: SingalProduct(
            //     productImage:
            //         "https://dosi-in.com/images/detailed/104/dosiin-teeholic-so-mi-tay-ngan-in-la-ma-roman-painting-104954104954.jpg",
            //     productName: "Frech",
            //   ),
            // ),
            // ],
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fatchHerbsProductData();
    productProvider.fatchFreshProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    return Scaffold(
      drawer: DrawerSide(),
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
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
                      builder: (context) => Search(),
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
                      builder: (context) => ReviewCart(),
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
                          Text(
                            "30% off",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.green[100],
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "On all vegate",
                              style: TextStyle(
                                color: Colors.white,
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
            _singalProduct(context),
            _buildFreshProduct(context),
          ],
        ),
      ),
    );
  }
}
