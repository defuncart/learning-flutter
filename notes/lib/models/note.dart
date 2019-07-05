import 'package:flutter/foundation.dart';

/// A model representing a note
class Note {
  /// The note's (unique) id
  final int id;

  /// The note's title (can be null)
  final String title;

  /// The note's contents
  final String contents;

  /// Constructs a new Note
  Note({
    @required this.id,
    this.title,
    @required this.contents,
  });

  /// Converts an instance from json
  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"],
        title: json["title"],
        contents: json["contents"],
      );

  /// Converts the instance to json
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "contents": contents,
      };

  /// Returns a string representation of the object
  @override
  String toString() {
    return '$id : $title, $contents';
  }
}
