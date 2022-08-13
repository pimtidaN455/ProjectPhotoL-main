import 'dart:async';
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';

class SqliteManage {
  final String _databaseName = "ActressData.db";
  final int _databaseVersion = 1;

  final String _createSQL = "CREATE TABLE ActressList("
      "ID ALBUM,"
      "NAME ALBUM,"
      "KeyWord ALBUM"
      ")";
  late String createSqlCommand;
  late String databasePath;
  late String dbPath;
  late Database _database;

  void openOrCreateDatabase() async {
    createSqlCommand = _createSQL;

    databasePath = await getDatabasesPath();
    dbPath = join(databasePath, _databaseName);

    _database = await openDatabase(dbPath,
        version: _databaseVersion, onCreate: createDatabase);
  }

  Future<void> createDatabase(Database db, int version) async {
    if (createSqlCommand != "") {
      await db.execute(createSqlCommand);
    }
  }

  //Future queryDatabase(String sqlString) async {
  Future<List<Map<String, dynamic>>> queryDatabase(String sqlString) async {
    createSqlCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath, _databaseName);
    _database = await openDatabase(dbPath,
        version: _databaseVersion, onCreate: createDatabase);
    return await _database.rawQuery(sqlString);
  }

  Future insertDatabase(String sqlString) async {
    createSqlCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath, _databaseName);
    _database = await openDatabase(dbPath,
        version: _databaseVersion, onCreate: createDatabase);
    return await _database.rawInsert(sqlString);
  }

  Future updateDatabase(String sqlString) async {
    createSqlCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath, _databaseName);
    _database = await openDatabase(dbPath,
        version: _databaseVersion, onCreate: createDatabase);
    return await _database.rawUpdate(sqlString);
  }

  Future deleteDatabase(String sqlString) async {
    createSqlCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath, _databaseName);
    _database = await openDatabase(dbPath,
        version: _databaseVersion, onCreate: createDatabase);
    return await _database.rawDelete(sqlString);
  }

  void closeDatabase() async {
    createSqlCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath, _databaseName);
    _database = await openDatabase(dbPath,
        version: _databaseVersion, onCreate: createDatabase);
    await _database.close();
  }
}
