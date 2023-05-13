import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/cart_model.dart';
import '../models/favorite_model.dart';
import '../models/user_model.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'furniture.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Cart("
          "idCart INTEGER PRIMARY KEY AUTOINCREMENT,"
          "nameProduct TEXT NOT NULL,"
          "color TEXT NOT NULL,"
          "imgProduct TEXT NOT NULL,"
          "idProduct TEXT NOT NULL,"
          "quantity INTEGER NOT NULL, "
          "price REAL NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE Favorite("
          "idFavorite INTEGER PRIMARY KEY AUTOINCREMENT,"
          "nameProduct TEXT NOT NULL,"
          "imgProduct TEXT NOT NULL,"
          "idProduct TEXT NOT NULL,"
          "price REAL NOT NULL)",
        );
        await database.execute("CREATE TABLE UserSQ("
            "idUser TEXT PRIMARY KEY NOT NULL,"
            "phone TEXT NOT NULL,"
            "fullName TEXT NOT NULL,"
            "address TEXT NOT NULL,"
            "img TEXT NOT NULL,"
            "birthDate TEXT NOT NULL,"
            "dateEnter TEXT NOT NULL,"
            "status TEXT NOT NULL,"
            "gender TEXT NOT NULL,"
            "email TEXT NOT NULL)");
      },
      version: 1,
    );
  }

  // Card Method
  List<Cart> listCart = [];

  Future<int> insertCart(Cart cart) async {
    int result = 0;
    final Database db = await initializeDB();
    List<Cart> listOldCart = getListCart;
    int? idCart = -1;
    int quantity = 0;
    for(var ca in listOldCart) {
      if(ca.idProduct == cart.idProduct) {
        idCart = ca.idCart;
        quantity = ca.quantity;
        break;
      }
    }

    if(idCart == -1) {
      result = await db.insert('Cart', cart.toMap());
    }
    else {
      result = await db.update(
        'Cart',
        {'quantity': quantity + 1},
        where: 'idCart = ?',
        whereArgs: [idCart],
      );
    }
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

  Future<void> updateCart(int idCart, int quantity) async {
    final db = await initializeDB();
    await db.update(
      'Cart',
      {'quantity': quantity},
      where: 'idCart = ?',
      whereArgs: [idCart],
    );
  }

  // Favorite Method
  List<Favorite> listFavorite = [];
  Future<int> insertFavorite(Favorite favorite) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.insert('Favorite', favorite.toMap());
    return result;
  }

  Future<List<Favorite>> retrieveFavorites() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('Favorite');
    listFavorite = queryResult.map((e) => Favorite.fromMap(e)).toList();
    return queryResult.map((e) => Favorite.fromMap(e)).toList();
  }

  Future<void> deleteFavorite(int idFavorite) async {
    final db = await initializeDB();
    await db.delete(
      'Favorite',
      where: "idFavorite = ?",
      whereArgs: [idFavorite],
    );
  }

  List<Favorite> get getListFavorite {
    retrieveFavorites();
    return listFavorite;
  }

  // User method
  List<UserSQ> listUser = [];
  Future<int> insertUser(UserSQ user) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.insert('UserSQ', user.toMap());
    return result;
  }

  Future<List<UserSQ>> retrieveUser() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('UserSQ');
    listUser = queryResult.map((e) => UserSQ.fromMap(e)).toList();
    return queryResult.map((e) => UserSQ.fromMap(e)).toList();
  }

  Future<void> deleteUser(int idUser) async {
    final db = await initializeDB();
    await db.delete(
      'UserSQ',
      where: "idUser = ?",
      whereArgs: [idUser],
    );
  }

  List<UserSQ> get getListUser {
    retrieveUser();
    return listUser;
  }
}
