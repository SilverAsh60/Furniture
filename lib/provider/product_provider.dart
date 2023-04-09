import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_funiture_app/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<Product> listProduct = [];
  List<ProductItem> listProductItem = [];
  Product productCurrent = Product(name: '', color: '', img: '', id: '', description: '', size: [], rootPrice: 0, currentPrice: 0, categoryItemId: '', status: '');
  String id ='';

  Future<void> getProduct() async {
    List<Product> newList = [];

    QuerySnapshot productSnapshot =
    await FirebaseFirestore.instance.collection("product").get();

    for (var doc in productSnapshot.docs) {
      var product = Product(
        img: doc["img"],
        color: doc['color'],
        name: doc["name"],
        id: doc["id"],
        size: List.from(doc["size"]),
        rootPrice: double.parse(doc["rootPrice"].toString()),
        currentPrice: double.parse(doc["currentPrice"].toString()),
        categoryItemId: doc["categoryItemId"].toString(),
        description: doc["description"].toString(),
        status: doc["status"].toString(),
      );

      newList.add(product);
    }

    listProduct = newList;
    notifyListeners();
  }

  Future<void> getProductItem(String id) async {

    List<ProductItem> newListItem = [];

    CollectionReference product = FirebaseFirestore.instance.collection("product");

    QuerySnapshot productSnapshotItem = await product.doc(id).collection('product-item').get();

    for (var doc in productSnapshotItem.docs) {
      var proItem = ProductItem(
        id: doc["id"],
        color: doc['color'],
        img: List.from(doc["img"]),
      );

      newListItem.add(proItem);
    }
    id = id;
    listProductItem = newListItem;
    notifyListeners();

  }

  Future<void> getProductbyID(String id) async {

    DocumentSnapshot productSnapshot =
    await FirebaseFirestore.instance.collection("product").doc(id).get();

    var product = Product(
      img: productSnapshot["img"],
      color: productSnapshot['color'],
      name: productSnapshot["name"],
      id: productSnapshot["id"],
      size: List.from(productSnapshot["size"]),
      rootPrice: double.parse(productSnapshot["rootPrice"].toString()),
      currentPrice: double.parse(productSnapshot["currentPrice"].toString()),
      categoryItemId: productSnapshot["categoryItemId"].toString(),
      description: productSnapshot["description"].toString(),
      status: productSnapshot["status"].toString(),
    );

    id = id;
    productCurrent = product;
    notifyListeners();
  }

  List<Product> get getListProduct {
    //getProduct();
    return listProduct;
  }

  Product get getProductCurrent {
    //getProductbyID(id);
    return productCurrent;
  }

  List<ProductItem> get getListProductItem {
    //getProductItem(id);
    return listProductItem;
  }
}
