/// A class of database utils
class DatabaseUtils {
  /// The notes database filename
  static const String notesDatabaseFilename = 'notes.db';

  /// The path to the template notes database asset
  static const String notesDatabaseAssetTemplatePath = 'assets/database/template.db';

  /// SQL Query text to insert a note.
  ///
  /// INSERT INTO Notes(title, contents) VALUES(?, ?)
  static const String queryInsertNote = 'INSERT INTO Notes(title, contents) VALUES(?, ?)';

  /// SQL Query text to update a note.
  ///
  /// UPDATE Notes SET title = ?, contents = ? WHERE id = ?
  static const String queryUpdateNote = 'UPDATE Notes SET title = ?, contents = ? WHERE id = ?';

  /// SQL Query text to delete a note.
  ///
  /// DELETE FROM Notes WHERE id = ?
  static const String queryDeleteNote = 'DELETE FROM Notes WHERE id = ?';

  /// SQL Query text to select all notes.
  ///
  /// SELECT * FROM Notes
  static const String querySelectAllNotes = 'SELECT * FROM Notes';

  /// SQL Query text to select a note.
  ///
  /// SELECT * FROM Notes WHERE id = ?
  static const String querySelectNote = 'SELECT * FROM Notes WHERE id = ?';
}
