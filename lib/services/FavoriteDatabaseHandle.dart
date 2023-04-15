import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/favorite_model.dart';


class FavoriteDatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'furniture.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Favorite(idFavorite INTEGER PRIMARY KEY AUTOINCREMENT,nameProduct TEXT NOT NULL,imgProduct TEXT NOT NULL,idProduct TEXT NOT NULL,price REAL NOT NULL)",
        );
      },
      version: 1,
    );
  }

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
}