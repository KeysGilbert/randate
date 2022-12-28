import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:randate/model/date_model.dart';

class DatabaseHelper {
  static Database? _db;

  Future<Database> get db async {
    return _db ??= await init_db("Date.db");
  }

  //create database when it doesn't exist
  Future<Database> init_db(String name) async {
    //locate database
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, name);

    //open database and return
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //TO-DO: implement _onCreate() to execute DDL
}
