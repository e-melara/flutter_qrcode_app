import 'dart:io';

import 'package:path/path.dart';
import 'package:qrcodeapp/src/models/scan.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DbProvider {
  static Database _database;
  static final DbProvider db = DbProvider._();
  DbProvider._();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await init();
    return _database;
  }

  init() async {
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScanDB.db');
    await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        String queryString = """ 
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        """;
        await db.execute(queryString);
      },
    );
  }

  Future<int> add(Scan scan) async {
    final db = await database;
    return await db.insert('Scans', scan.toJson());
  }

  Future<List<Scan>> getAll() async {
    final db = await database;
    final rows = await db.query('Scans');

    if (rows.isNotEmpty) {
      return rows.map((c) => Scan.fromJson(c));
    }
    return [];
  }

  Future<Scan> getById(Scan scan) async {
    final db = await database;
    final result =
        await db.query('Scans', where: 'id = ?', whereArgs: [scan.id]);

    if (result.isNotEmpty) {
      return Scan.fromJson(result.first);
    }
    return null;
  }

  Future<Scan> getByType(Scan scan) async {
    final db = await database;
    final result =
        await db.query('Scans', where: 'tipo = ?', whereArgs: [scan.tipo]);

    if (result.isNotEmpty) {
      return Scan.fromJson(result.first);
    }
    return null;
  }

  Future<int> update(Scan scan) async {
    final db = await database;
    return await db
        .update("Scans", scan.toJson(), where: 'id=?', whereArgs: [scan.id]);
  }

  Future<int> deleteById(Scan scan) async {
    final db = await database;
    return await db.delete("Scans", where: 'id=?', whereArgs: [scan.id]);
  }

  Future<int> deleteAll() async {
    final db = await database;
    return await db.delete("Scans");
  }
}
