import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class DatabaseService {
  static Future<Database> initializeDatabase() async {
    String path = '';
    if (kIsWeb) {
      // Change default factory on the web
      databaseFactory = databaseFactoryFfiWeb;
      path = 'products.db';
    } else {
      var databasesPath = await getDatabasesPath();
      path = join(databasesPath, 'products.db');
    }

    return openDatabase(path, onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE products(id INTEGER PRIMARY KEY, name TEXT, description TEXT, price REAL, page INTEGER, isSynced INTEGER)",
      );
    }, version: 1);
  }

  static Future<void> insertProduct(Map<String, dynamic> product) async {
    final db = await initializeDatabase();
    await db.insert(
      'products',
      product,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getProducts(int page) async {
    final db = await initializeDatabase();
    return db.query(
      'products',
      where: 'page = ? AND isSynced = ?',
      whereArgs: [page, 0], // Only unsynced products
    );
  }

  static Future<void> updateSyncStatus(int id, bool isSynced) async {
    final db = await initializeDatabase();
    await db.update(
      'products',
      {'isSynced': isSynced ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
