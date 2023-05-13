import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_funiture_app/services/DatabaseHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:final_project_funiture_app/models/order_model.dart';
import 'package:sqflite/sqflite.dart';

import '../models/cart_model.dart';

class OrderProvider extends ChangeNotifier {

   bool addCartSucc = false;
  Future<void> addOrder(order , listCart) async {
    bool flag = false;
    DatabaseHandler handler = DatabaseHandler();
    await FirebaseFirestore.instance.collection('order').doc(order.idOrder).set(order.toMap()).then((value) async {
      for( Cart cart in listCart) {
        await FirebaseFirestore.instance.collection('order').doc(order.idOrder).collection('order-item').doc(cart.idCart.toString()).set(cart.toMap()).then((value) => handler.deleteCart(cart.idCart!));
      }
    }).then((value) => flag = true);

    addCartSucc = flag;
  }

  bool get getStatus {
    return addCartSucc;
  }
}