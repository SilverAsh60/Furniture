import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_funiture_app/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> listCategory = [];
  late Category category;

  Future<void> getCategory() async {
    List<Category> newList = [];

    QuerySnapshot categorySnaphot =
        await FirebaseFirestore.instance.collection("category").get();

    for (var element in categorySnaphot.docs) {
      category = Category(
        img: element["img"].toString(),
        name: element["name"].toString(),
        id: element["id"].toString(),
        status: element["status"].toString(),
      );

      newList.add(category);
    }

    listCategory = newList;
    notifyListeners();
  }

  List<Category> get getListCategory {
    return listCategory;
  }
}
