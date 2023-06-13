import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/model/product_model.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel _productModel;

  List<ProductModel> seach = [];

  productModels(QueryDocumentSnapshot element) {
    _productModel = ProductModel(
      productName: element.get("productName"),
      productImage: element.get("productImage"),
      productPrice: element.get("productPrice"),
    );
    seach.add(_productModel);
  }

  List<ProductModel> productList = [];
  fatchProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("products").get();
    value.docs.forEach(
      (element) {
        productModels(element);

        newList.add(_productModel);
      },
    );
    productList = newList;
    notifyListeners();
  }

  List<ProductModel> get getProductDataList {
    return productList;
  }

  ////////////////ProductT-Shirt
  List<ProductModel> productTshirtList = [];
  fatchProductTshirtList() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("producttshirt").get();
    value.docs.forEach(
      (element) {
        productModels(element);
        newList.add(_productModel);
      },
    );
    productTshirtList = newList;
    notifyListeners();
  }

  List<ProductModel> get getProductTshirtList {
    return productTshirtList;
  }

  ////////Product Shoe
  List<ProductModel> productShoeList = [];
  fatchProductShoeList() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("productshoe").get();
    value.docs.forEach(
      (element) {
        productModels(element);
        newList.add(_productModel);
      },
    );
    productShoeList = newList;
    notifyListeners();
  }

  List<ProductModel> get getProductShoeList {
    return productShoeList;
  }

  List<ProductModel> get getAllSearch {
    return seach;
  }
}
