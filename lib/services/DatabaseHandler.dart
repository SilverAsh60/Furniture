import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/cart_model.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'furniture.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Cart(idCart INTEGER PRIMARY KEY AUTOINCREMENT,nameProduct TEXT NOT NULL,color TEXT NOT NULL,imgProduct TEXT NOT NULL,idProduct TEXT NOT NULL,quantity INTEGER NOT NULL, price REAL NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE Favorite(idFavorite INTEGER PRIMARY KEY AUTOINCREMENT,nameProduct TEXT NOT NULL,imgProduct TEXT NOT NULL,idProduct TEXT NOT NULL,price REAL NOT NULL)",
        );
      },
      version: 1,
    );
  }

  List<Cart> listCart = [];
  Future<int> insertCart(Cart cart) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.insert('Cart', cart.toMap());
    return result;
  }

  Future<List<Cart>> retrieveCarts() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('Cart');
    listCart = queryResult.map((e) => Cart.fromMap(e)).toList();
    return queryResult.map((e) => Cart.fromMap(e)).toList();

  }

  Future<void> deleteCart(int idCart) async {
    final db = await initializeDB();
    await db.delete(
      'Cart',
      where: "idCart = ?",
      whereArgs: [idCart],
    );
  }

  List<Cart> get getListCart {
    retrieveCarts();
    return listCart;
  }

  Future<void> updateCart(int idCart , int quantity) async {
    final db = await initializeDB();
    await db.update(
      'Cart',
      {
        'quantity': quantity
      },
      where: 'idCart = ?',
      whereArgs: [idCart],
    );
  }
}