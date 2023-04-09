import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/category_model.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> listCategory = [];
  late Category category;
  List<String> nameCategory = [];
  List<String> imgCategory = [];

  Future<void> getCategory() async {
    List<Category> newList = [];

    QuerySnapshot categorySnaphot =
        await FirebaseFirestore.instance.collection("category").get();

    for (var doc in categorySnaphot.docs) {
      category = Category(
        img: doc["img"].toString(),
        name: doc["name"].toString(),
        id: doc["id"].toString(),
        status: doc["status"].toString(),
      );

      newList.add(category);
    }

    listCategory = newList;
    notifyListeners();
  }

  getCategoryL() async {
    return await FirebaseFirestore.instance.collection("category").get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        nameCategory.add(doc['name'].toString());
        notifyListeners();
      }
    });
  }

  List<String> getNameCate() {
    return nameCategory;
  }

  List<Category> get getListCategory {
    getCategory();
    return listCategory;
  }
}
