import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

import '../../core.dart';

class DatabaseHelper {
  static const _databaseName = "favourite_grammar.db";
  static const _databaseVersion = 1;

  static const table = "favourite_grammar_table";

  static const id = "id";
  static const nameJP = "nameJP";
  static const nameVN = "nameVN";

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  _initDatabase() async {
    String path = p.join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table(
      $id INTEGER PRIMARY KEY, $nameJP TEXT, $nameVN TEXT
    )
    ''');
  }

  Future<int> insertGrammar(Grammar grammar) async {
    Database db = await instance.database;
    var res = await db.insert(table, grammar.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    var res = await db.query(table);
    return res;
  }

  Future<List<Map<String, Object?>>> clearTable() async {
    Database db = await instance.database;
    return await db.rawQuery("DELETE from $table");
  }

  Future<List<Map<String, Object?>>> deleteGrammar(int id) async {
    Database db = await instance.database;
    return await db.rawQuery("DELETE FROM $table WHERE id = '$id'");
  }

  Future<int> checkGrammar(int id) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM $table WHERE id = '$id'");
    if (maps.isEmpty) {
      return 0;
    } else {
      return maps.length;
    }
  }

  Future<List<Grammar>> listFavourite() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return Grammar(
        id: maps[i]["id"],
        nameJP: maps[i]["nameJP"],
        nameVN: maps[i]["nameVN"],
      );
    });
  }
}
