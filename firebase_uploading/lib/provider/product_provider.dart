import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_uploading/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel _productModel;

//product1
  List<ProductModel> herbsProductList = [];
  fatchHerbsProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("HerbsProduct").get();
    value.docs.forEach(
      (element) {
        _productModel = ProductModel(
          productName: element.get("productName"),
          productImage: element.get("productImage"),
          productPrice: element.get("productPrice"),
        );
        newList.add(_productModel);
      },
    );
    herbsProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getHerbsProductDataList {
    return herbsProductList;
  }

//product2
  List<ProductModel> freshProductList = [];
  fatchFreshProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("FreshProduct").get();
    value.docs.forEach(
      (element) {
        _productModel = ProductModel(
          productName: element.get("productName"),
          productImage: element.get("productImage"),
          productPrice: element.get("productPrice"),
        );
        newList.add(_productModel);
      },
    );
    freshProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getFreshProductDataList {
    return freshProductList;
  }
}
