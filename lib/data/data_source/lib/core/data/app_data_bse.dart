import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class AppDatabase {
  static const String _dbName = 'appdb';
  static AppDatabase? _singleton;
  Database? db;

  factory AppDatabase() {
    _singleton ??= AppDatabase._();
    return _singleton!;
  }

  AppDatabase._();

  Future init() async {
    db ??= await _setupDataBase(_dbName, null);
  }

  Future<Database> _setupDataBase(String dbName, String? securityDbPass) async {
    var dbRoute = await _getDbRoute(dbName);
    var dbFactory = databaseFactoryIo;

    return await dbFactory.openDatabase(dbRoute);
  }

  Future deleteDatabase() async {
    var appDocDirectory = await getApplicationDocumentsDirectory();
    await databaseFactoryIo.deleteDatabase('${appDocDirectory.path}/$_dbName.db');

    db = null;
  }

  void save() {}

  Future<String> _getDbRoute(String dbName) async {
    if (kIsWeb) {
      return dbName;
    }

    var appDocDirectory = await getApplicationDocumentsDirectory();
    var dbPath = '${appDocDirectory.path}/$dbName.db';

    return dbPath;
  }
}
