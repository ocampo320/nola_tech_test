import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class LocalDatabase {
  static const String _DATABASE_NAME = "tasks.db";
  static final LocalDatabase _singleton = LocalDatabase._();

  static LocalDatabase get instance => _singleton;
  Completer<Database>? _dbOpenCompleter;
  LocalDatabase._();

  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      _openDatabase();
    }
    return _dbOpenCompleter!.future;
  }

  Future _openDatabase() async {
    final Directory appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, _DATABASE_NAME);

    final database = await databaseFactoryIo.openDatabase(dbPath);
    _dbOpenCompleter!.complete(database);
  }
}
