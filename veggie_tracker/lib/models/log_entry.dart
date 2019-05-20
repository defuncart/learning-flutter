import 'package:meta/meta.dart';
import 'package:veggie_tracker/enums/meal.dart';

/// A model representing a log entry (vegetable eaten)
class LogEntry {
  /// The veggie id
  final int veggieId;

  /// The quantity eaten
  final int servings;

  /// The time eaten
  final DateTime timestamp;

  /// At which meal time the veggie was eaten
  final Meal meal;

  /// Constructor
  const LogEntry({
    @required this.veggieId,
    @required this.servings,
    @required this.timestamp,
    @required this.meal,
  });

  /// Deserializes a new instance from json
  factory LogEntry.fromJson(Map<String, dynamic> json) => new LogEntry(
        veggieId: json["veggieId"],
        servings: json["servings"],
        timestamp: DateTime.fromMicrosecondsSinceEpoch(json["timestamp"]),
        meal: Meal.values[json["meal"]],
      );

  /// Serializes the instance to json
  Map<String, dynamic> toJson() => {
        "veggieId": veggieId,
        "servings": servings,
        "timestamp": timestamp.microsecondsSinceEpoch,
        "meal": meal.index,
      };
}
