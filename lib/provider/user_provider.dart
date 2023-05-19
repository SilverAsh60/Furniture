import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';

class UserProvider extends ChangeNotifier {
  List<UserSQ> listUser = [];
  UserSQ currentUser = const UserSQ(status: '',
      email: '', phone: '', fullName: '', address: '', img: '',
      birthDate: '', idUser: '', dateEnter: '', gender: '');


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

  Future<void> getDocCurrentUser(String? id) async {

    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('user').doc(id).get();
    var us = UserSQ(
        status: documentSnapshot['status'],
        email: documentSnapshot['email'],
        phone: documentSnapshot['phone'],
        fullName: documentSnapshot['fullName'],
        address: documentSnapshot['address'],
        img: documentSnapshot['img'],
        birthDate: documentSnapshot['birthDate'],
        idUser:documentSnapshot['idUser'],
        dateEnter: documentSnapshot['dateEnter'],
        gender: documentSnapshot['gender']);

    currentUser = us;
    notifyListeners();
  }
  
  Future<void> updateUser(UserSQ user) async {
    await FirebaseFirestore.instance.collection('user').doc(user.idUser).set(user.toMap());
    getDocCurrentUser(user.idUser);
  }

  UserSQ get getCurrentUser {
    return currentUser;
  }

  List<UserSQ> get getListUserSQ {
    return listUser;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
