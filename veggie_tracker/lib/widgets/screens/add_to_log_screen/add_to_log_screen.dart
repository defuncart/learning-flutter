import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:veggie_tracker/states/app_state.dart';
import 'package:veggie_tracker/widgets/adaptive/adaptive_page_scaffold.dart';
import 'package:veggie_tracker/widgets/screens/add_to_log_screen/add_to_log_form.dart';

/// A screen which allows the user to add a new log entry
class AddToLogScreen extends StatelessWidget {
  /// The veggie id to add
  final int veggieId;

  /// Constructor
  const AddToLogScreen(this.veggieId);

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    /// The current app state
    final appState = Provider.of<AppState>(context, listen: true);

    return AdaptivePageScaffold(
      title: 'Add to Log',
      child: AddToLogForm(appState.veggieById(veggieId), (entry) {
        appState.addLogEntry(entry);
        Navigator.of(context).pop();
      }),
    );
  }
}
