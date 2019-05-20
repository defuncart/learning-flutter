import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:veggie_tracker/states/app_state.dart';
import 'package:veggie_tracker/view_models/daily_summary_view_model.dart';
import 'package:veggie_tracker/view_models/log_entry_view_model.dart';
import 'package:veggie_tracker/widgets/adaptive/adaptive_page_scaffold.dart';
import 'package:veggie_tracker/widgets/screens/list_screen/list_screen.dart';
import 'package:veggie_tracker/widgets/screens/log_screen/daily_display.dart';

/// The log screen which displays a log veggies eaten
class LogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// The current app state
    final appState = Provider.of<AppState>(context, listen: true);

    /// A list of day summary vms
    final dayModels = appState.days.map((day) {
      return DailySummaryViewModel(
        day,
        appState.entriesForDay(day).map((entry) {
          return LogEntryViewModel(entry, appState.veggieById(entry.veggieId));
        }).toList(),
      );
    }).toList();

    return AdaptivePageScaffold(
      title: 'Your Log',
      child: ListView.builder(
        itemCount: dayModels.length,
        itemBuilder: (context, index) => DailyDisplay(dayModels[index]),
      ),
      // On Android, display an add button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ListScreen(),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
