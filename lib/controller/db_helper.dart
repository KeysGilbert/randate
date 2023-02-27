import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:randate/model/date_model.dart';
import 'package:flutter/foundation.dart';

class DatabaseHelper {
  static Database? _db;

  //create singleton
  DatabaseHelper._constructor();
  static final DatabaseHelper instance = DatabaseHelper._constructor();

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

  //Create date table
  Future _onCreate(Database db, int version) async {
    await db
        .execute("CREATE TABLE Dates (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, dateText TEXT)");
  }

  //add user input to table
  Future<int> add(DateModel dateModel) async {
    Database db = await instance.db;
    final id = await db.insert("Dates", dateModel.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    return dateModel.id = id; 
    
  }

  //remove date from table
  Future<int> remove(int id) async {
    Database db = await instance.db;
    return await db.delete("Dates", where: "id = ?", whereArgs: [id]);
  }

  Future<List> getDates() async {
    Database db = await instance.db;
    final data = await db.rawQuery("SELECT * FROM Dates");
    if (data.isNotEmpty) {
      return data;
    } else {
      return [];
    }
  }
}
