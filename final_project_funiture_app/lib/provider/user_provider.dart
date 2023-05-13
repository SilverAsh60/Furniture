import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_funiture_app/models/user_model.dart';
import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';

class UserProvider extends ChangeNotifier {
  List<UserSQ> listUser = [];

  Future<void> getListUser(List<Review> listReview) async {
    List<UserSQ> newList = [];
    for (var re in listReview) {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(re.idUser)
          .get()
          .then((value) {
        var us = UserSQ(
            status: value.data()!['status'],
            email: value.data()!['email'],
            phone: value.data()!['phone'],
            fullName: value.data()!['fullName'],
            address: value.data()!['address'],
            img: value.data()!['img'],
            birthDate: value.data()!['birthDate'],
            idUser: value.data()!['idUser'],
            dateEnter: value.data()!['dateEnter'],
            gender: value.data()!['gender']);

        newList.add(us);
      });
    }

    listUser = newList;
    notifyListeners();
  }

  List<UserSQ> get getListUserSQ {
    return listUser;
  }
}
