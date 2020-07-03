import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/models/notes.dart';

class DatabaseHelper {
  //Singleton Database Helper
  static DatabaseHelper _databaseHalper;

  //Singleton Database
  static Database _database;

  //Named Constructor to create instance of database
  DatabaseHelper._createInstance();

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  factory DatabaseHelper() {
    if (_databaseHalper == null) {
      _databaseHalper = DatabaseHelper._createInstance();
    }
    return _databaseHalper;
  }

  Future<Database> get database async {
    if (_database != null) {
      _database = await intializeDatabase();
    }
    return _database;
  }

  get db => null;

  Future<Database> intializeDatabase() async {
    // get the directory path
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';
    // open/create the database at a given path
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  // creating Database
  void _createDb(Database db, int Version) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT,' +
            '$colDescription TEXT,$colPriority INTEGER,$colDate TEXT');
  }

  //Fatch Operation
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    var result = await db.query(noteTable, orderBy: '$colPriority ASC');
    return result;
  }

  //Insert Operation
  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

  //Update Operation
  Future<int> updateNote(Note note) async {
    var db = await this.database;
    var result = await db.update(noteTable, note.toMap(),
        where: '$colId= ?', whereArgs: [note.id]);
    return result;
  }

  //Delete Operation
  Future<int> deletetNote(int id) async {
    var db = await this.database;
    var result = await db.rawDelete('DELETE FROM $noteTable WERE $colId = $id');
    return result;
  }

  //get number of note obj in database
  Future<int> getCount() async {
    var db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }
} // end od class
