import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart' as paths;
import 'package:veggie_tracker/models/log_entry.dart';
import 'package:veggie_tracker/models/veggie.dart';
import 'package:veggie_tracker/providers/veggie_provider.dart';
import 'package:veggie_tracker/utils/app_utils.dart';

/// The current state of the app.
///
/// This class is basically just a list of log entries, plus the available
/// library of veggies and some code to serialize data to and from files as
/// JSON. It's also a Listenable, so ScopedModel descendants will be updated
/// each time [notifyListeners] is invoked.
class AppState extends ChangeNotifier {
  /// A list of all veggies
  final allVeggies = VeggieProvider.veggies;

  /// A list of log entries
  final logEntries = <LogEntry>[];

  /// Constructor
  AppState() {
    _readEntriesFromStorage().then((list) {
      logEntries.addAll(list);
      notifyListeners();
    });
  }

  /// A list of unique days from log entries
  List<DateTime> get days {
    return logEntries.map((e) => e.timestamp).fold(<DateTime>[], (t, e) {
      return (t.isEmpty || !AppUtils.datesAreSameDay(t.last, e)) ? (t..add(e)) : t;
    }).toList();
  }

  /// Returns a veggie by id
  Veggie veggieById(int id) => allVeggies.firstWhere((e) => e.id == id);

  /// Returns all log entries for a day
  Iterable<LogEntry> entriesForDay(DateTime day) {
    return logEntries.where((e) => AppUtils.datesAreSameDay(day, e.timestamp)).toList();
  }

  /// Add a log entry
  void addLogEntry(LogEntry entry) {
    logEntries.add(entry);
    _writeEntriesToStorage(logEntries);
    notifyListeners();
  }

  /// Writes all the log entries to disk
  Future<void> _writeEntriesToStorage(List<LogEntry> entries) async {
    final dir = await paths.getApplicationDocumentsDirectory();
    final file = File('${dir.path}/entries.json');

    return file.writeAsString(
      json.encode(entries.map((e) => e.toJson()).toList()),
    );
  }

  /// Reads all the log entries from disk
  Future<List<LogEntry>> _readEntriesFromStorage() async {
    final dir = await paths.getApplicationDocumentsDirectory();
    final file = File('${dir.path}/entries.json');

    if (await file.exists()) {
      final jsonStr = await file.readAsString();
      final decoded = json.decode(jsonStr);
      return decoded.map<LogEntry>((x) => LogEntry.fromJson(x)).toList();
    } else {
      return <LogEntry>[];
    }
  }
}
