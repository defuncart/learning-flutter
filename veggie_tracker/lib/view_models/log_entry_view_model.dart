import 'package:veggie_tracker/models/log_entry.dart';
import 'package:veggie_tracker/models/veggie.dart';

/// A ViewModel that combines data from a single LogEntry with the veggie it references.
class LogEntryViewModel {
  /// The entry's timestamp
  final DateTime timestamp;

  /// The entry's veggie
  final Veggie veggie;

  /// The number of servings
  final int servings;
  
  /// The number of calories
  final int calories;

  /// The percentage of vitamin a
  final int vitaminAPercentage;

  /// The percentage of vitamin c
  final int vitaminCPercentage;

  /// Constructor
  LogEntryViewModel(LogEntry entry, this.veggie)
      : timestamp = entry.timestamp,
        servings = entry.servings,
        calories = veggie.caloriesPerServing * entry.servings,
        vitaminAPercentage = veggie.vitaminAPercentage * entry.servings,
        vitaminCPercentage = veggie.vitaminCPercentage * entry.servings;
}
