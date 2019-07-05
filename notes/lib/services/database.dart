import 'dart:io';
import 'package:flutter/services.dart';
import 'package:notes/models/note.dart';
import 'package:notes/utils/database_utils.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart' as sqflite;

/// A Database to store notes
class Database {
  /// An internal constructor
  Database._();

  /// A backing variable for instance
  static Database _instance;

  /// A single instance of the class
  static Database get instance {
    if (_instance == null) {
      _instance = Database._();
    }
    return _instance;
  }

  /// The sqlite database
  sqflite.Database _database;

  /// Initializes the service
  Future init() async {
    // determine the database path
    final defaultDatabasePath = await getDatabasesPath();
    final databasePath = path.join(defaultDatabasePath, DatabaseUtils.notesDatabaseFilename);

    // create the database and save to disk if needed
    bool databaseAlreadyCreated = await databaseExists(databasePath);
    if (!databaseAlreadyCreated) {
      await _createDatabase(databasePath);
    }

    // open the database
    _database = await openDatabase(databasePath);
  }

  /// Creates the database by reading a template from assets
  Future _createDatabase(String databasePath) async {
    ByteData data = await rootBundle.load(DatabaseUtils.notesDatabaseAssetTemplatePath);
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(databasePath).writeAsBytes(bytes);
  }

  /// Creates and returns a new note
  Future<Note> createNote({String title = '', String contents = ''}) async {
    int id = await _insertNote(title, contents);
    return getNote(id: id);
  }

  /// Inserts a note into the database
  Future<int> _insertNote(String title, String contents) {
    return _database.rawInsert(DatabaseUtils.queryInsertNote, [title, contents]);
  }

  /// Updates a existing note in the database
  Future updateNote(Note note) async {
    _database.rawUpdate(DatabaseUtils.queryUpdateNote, [note.title, note.contents, note.id]);
  }

  /// Deletes a existing note from the database
  Future deleteNote(Note note) async {
    _database.rawUpdate(DatabaseUtils.queryDeleteNote, [note.id]);
  }

  /// Returns a note by id from the database
  Future<Note> getNote({int id}) async {
    List<Map> results = await _database.rawQuery(DatabaseUtils.querySelectNote, [id]);
    return Note.fromJson(results.first);
  }

  /// Returns all notes in the database
  Future<List<Note>> getAllNotes() async {
    List<Map> list = await _database.rawQuery(DatabaseUtils.querySelectAllNotes);
    return list.map((x) => Note.fromJson(x)).toList();
  }
}
