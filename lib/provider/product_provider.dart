
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_funiture_app/models/product_model.dart';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

class ProductProvider with ChangeNotifier {
  List<Product> listProduct = [];
  List<ProductItem> listProductItem = [];
  List<Product> listNewArchiveProduct = [];
  List<Product> listTopSeller = [];
  List<Product> listReview = [];
  List<Product> listDiscount = [];
  Product productCurrent = Product(name: '', img: '', id: '', description: '', rootPrice: 0, currentPrice: 0, categoryItemId: '', status: '', material: {}, size: {}, review: 0, sellest: 0, title: '');
  String id ='';

  // Get All Product
  Future<void> getProduct() async {
    List<Product> newList = [];
    List<Product> listDis = [];

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

        title: doc['title'],
      );

      if(product.currentPrice != product.rootPrice) {
        listDis.add(product);
      }

      newList.add(product);
    }

    listDiscount = listDis;
    listProduct = newList;
    notifyListeners();
  }

  // Get Product New Archive
  Future<void> getNewArchiveProduct() async {
    List<Product> newList = [];

    QuerySnapshot productSnapshot =
    await FirebaseFirestore.instance.collection('product').orderBy("timestamp", descending: true).limit(8).get();

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

        title: doc['title'],
      );

      newList.add(product);
    }

    listNewArchiveProduct = newList;
    notifyListeners();
  }

  // Get Product Top Seller
  Future<void> getTopSeller() async {
    List<Product> newList = [];

    QuerySnapshot productSnapshot =
    await FirebaseFirestore.instance.collection('product').orderBy("sellest", descending: true).limit(8).get();

    for (var doc in productSnapshot.docs) {
      var product = Product(
        img: doc["img"],
        name: doc["name"],
        id: doc.reference.id,
        size: Map.from(doc["size"]),
        rootPrice: double.parse(doc["rootPrice"].toString()),
        currentPrice: double.parse(doc["currentPrice"].toString()),
        categoryItemId: doc["categoryItemId"],
        description: doc["description"],
        status: doc["status"],
        material: Map<String,String>.from(doc["material"]),
        review: double.parse(doc["review"].toString()),
        sellest: double.parse(doc["sellest"].toString()),

        title: doc['title'],
      );

      newList.add(product);
    }

    listTopSeller = newList;
    notifyListeners();
  }

  // Get Product Top Seller
  Future<void> getReview() async {
    List<Product> newList = [];

    QuerySnapshot productSnapshot =
    await FirebaseFirestore.instance.collection('product').orderBy("review", descending: true).limit(8).get();

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
        //dateEnter: DateFormat("d/M/y").parse(doc['dateEnter']),
        title: doc['title'],
      );

      newList.add(product);
    }

    listReview = newList;
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
      title: productSnapshot['title'],
    );

    id = id;
    productCurrent = product;
    notifyListeners();
  }

  List<Product> get getListProduct {
    //getProduct();
    return listProduct;
  }

  List<Product> get getListNewArchiveProduct {
    return listNewArchiveProduct;
  }

  List<Product> get getListTopSeller {
    return listTopSeller;
  }

  List<Product> get getListReview {
    return listReview;
  }

  List<Product> get getListDiscount {
    return listDiscount;
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
