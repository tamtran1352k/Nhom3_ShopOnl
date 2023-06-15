import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/cart_model.dart';

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

  List<CartModel> cartModelList = [];
  late CartModel cartModel;

  void getCartData(
      {required String productName,
      required String productImage,
      required int productPrice,
      required int productQuantity}) {
    cartModel = CartModel(
      productName: productName,
      productImage: productImage,
      productPrice: productPrice,
      productQuantity: productQuantity,
    );
    cartModelList.add(cartModel);
  }

  List<CartModel> get getCartModelList {
    return List.from(cartModelList);
  }

  int get getCartModelListLength {
    return cartModelList.length;
  }

  ///////Delete Product
  void deleteProduct(int index) {
    cartModelList.removeAt(index);
    notifyListeners();
  }

  /////////Product Clock
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
