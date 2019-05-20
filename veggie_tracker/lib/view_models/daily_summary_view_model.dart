import 'package:veggie_tracker/view_models/log_entry_view_model.dart';

/// A ViewModel summarizing data for an entire day's worth of [LogEntry] objects.
class DailySummaryViewModel {
  /// A list of entries
  final List<LogEntryViewModel> entries;

  /// The day
  final DateTime day;

  /// Constructor
  const DailySummaryViewModel(this.day, this.entries);

  /// The total day's calories
  int get calories => entries.map((e) => e.calories).reduce((v, e) => v + e);

  /// The total day's vitamin a
  int get vitaminAPercentage => entries.map((e) => e.vitaminAPercentage).reduce((v, e) => v + e);

  /// The total day's vitamin c
  int get vitaminCPercentage => entries.map((e) => e.vitaminCPercentage).reduce((v, e) => v + e);
}
