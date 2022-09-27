// import 'dart:developer';
// import 'dart:html';

import 'package:example/models/UsersModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "Users.db";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            "CREATE TABLE User(Nis INTEGER PRIMARY KEY, Nama TEXT NOT NULL, PASSWORD TEXT NOT NULL);"),
        version: _version);
  }

  static Future<int> addUsers(Users users) async {
    final db = await _getDB();
    return await db.insert("User", users.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateUsers(Users users) async {
    final db = await _getDB();
    return await db.update("User", users.toJson(),
        where: 'Nis = ?',
        whereArgs: [users.Nis],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteUsers(Users users) async {
    final db = await _getDB();
    return await db.delete(
      "User",
      where: 'Nis = ?',
      whereArgs: [users.Nis],
    );
  }

  static Future<List<Users>?> getAllUsers() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("User");
    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Users.fromJson(maps[index]));
  }
}
