import 'dart:async';
import 'models/model.dart';
import 'package:sqflite/sqflite.dart';

abstract class DB {
  static Database _db;

  static int get _version => 1;

  static Future<void> init() async {
    if (_db != null) {
      return;
    }

    try {
      String _path = await getDatabasesPath() + 'db5';
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
    } catch (ex) {
      print(ex);
    }
  }

  var where;

  static void onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute(
        'CREATE TABLE Bookmarks (id INTEGER PRIMARY KEY NOT NULL, title STRING, url STRING)');
    batch.execute(
        'CREATE TABLE Settings (id INTEGER PRIMARY KEY NOT NULL, configuration STRING, value STRING)');
    batch.insert(
        'Settings', {'configuration': 'FirebaseDeviceToken', 'value': '0'});
    batch.insert('Settings', {'configuration': 'DarkMode', 'value': '0'});
    batch.insert('Settings', {'configuration': 'Ads', 'value': '0'});
    batch.insert('Settings', {'configuration': 'FirstTime', 'value': '1'});
    var results = await batch.commit();
    print(results);
  }

  static Future<List<Map<String, dynamic>>> query(String table,
      {List<String> columns, String where}) async {
    if (where != null) {
      return _db.query(table, where: where);
    }
    return _db.query(table);
  }

  static Future<int> insert(String table, Model model) async =>
      await _db.insert(table, model.toMap());

  static Future<int> update(String table, Model model) async => await _db
      .update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  static Future<int> delete(String table, Model model) async =>
      await _db.delete(table, where: 'id = ?', whereArgs: [model.id]);
}
