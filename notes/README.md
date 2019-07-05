# notes

A simple note-taking app built in Flutter (inspired by Google Keep).

![](screenshots/01.gif)

The goals of this project were:
- to display a grid view of widgets of varying height depending on their content
- to utilize SQLite within a Flutter app

## Overview

- *Database* is a simple singleton which loads the sqlite database (using *sqflite*) from disk on init. If the database doesn't exist on disk, then it reads in a template from assets.
- *DatabaseUtils* contains constants strings for insert, update, delete, select etc. sql queries.
- The widget tree consists of only two screens, *MainScreen* and *NoteScreen*:
    - *MainScreen* displays a list of database entries represented as *NoteTile*'s. These widgets are staggered on screen using *flutter_staggered_grid_view*.
    - *NoteScreen* facilitates the editing of an note.
- There is no shared state in this app. *NoteScreen* contains TextFields and is thus a StatefulWidget, while *MainScreen* is likewise a StatefulWidget so that it is automatically build after a pushed route is popped.

## Remarks

- The database was created using [DB Browser for SQLite](https://sqlitebrowser.org) on macOS, however it could have been created in code using:
```dart
Database database = await openDatabase(path, version: 1,
    onCreate: (Database db, int version) async {
  await db.execute(
      'CREATE TABLE Notes (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, title TEXT NOT NULL, contents TEXT NOT NULL)');
});
```
- I suppose *MainScreen* needs to be stateful as if it was stateless, then there would be no reason to rebuild it after popping a pushed route.

## Resources

[flutter_staggered_grid_view](https://pub.dev/packages/flutter_staggered_grid_view)

[sqflite](https://pub.dev/packages/sqflite)
