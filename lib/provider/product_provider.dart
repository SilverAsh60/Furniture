import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_funiture_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class ProductProvider with ChangeNotifier {
  List<Product> listProduct = [];
  List<ProductItem> listProductItem = [];
  Product productCurrent = Product(name: '', img: '', id: '', description: '', rootPrice: 0, currentPrice: 0, categoryItemId: '', status: '', material: {}, size: {}, review: 0, sellest: 0, dateEnter: DateTime.now());
  String id ='';

  Future<void> getProduct() async {
    List<Product> newList = [];

    QuerySnapshot productSnapshot =
    await FirebaseFirestore.instance.collection("product").get();

    for (var doc in productSnapshot.docs) {
      var product = Product(
        img: doc["img"],
        name: doc["name"],
        id: doc.reference.id,
        size: Map.from(doc["size"]),
        rootPrice: double.parse(doc["rootPrice"].toString()),
        currentPrice: double.parse(doc["currentPrice"].toString()),
        categoryItemId: doc["categoryItemId"].toString(),
        description: doc["description"].toString(),
        status: doc["status"].toString(),
        material: Map.from(doc["material"]),
        review: double.parse(doc["review"].toString()),
        sellest: double.parse(doc["sellest"].toString()),
        dateEnter: DateFormat("d/M/y").parse(doc['dateEnter']),
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
        id: doc.reference.id,
        color: Map.from(doc['color']),
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
      name: productSnapshot["name"],
      id: productSnapshot.reference.id,
      size: Map.from(productSnapshot["size"]),
      rootPrice: double.parse(productSnapshot["rootPrice"].toString()),
      currentPrice: double.parse(productSnapshot["currentPrice"].toString()),
      categoryItemId: productSnapshot["categoryItemId"].toString(),
      description: productSnapshot["description"].toString(),
      status: productSnapshot["status"].toString(),
      material: Map.from(productSnapshot["material"]),
      review: double.parse(productSnapshot["review"].toString()),
      sellest: double.parse(productSnapshot["sellest"].toString()),
      dateEnter: DateFormat("d/M/y").parse(productSnapshot['dateEnter']),
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
