import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:veggie_tracker/states/app_state.dart';
import 'package:veggie_tracker/widgets/adaptive/adaptive_page_scaffold.dart';
import 'package:veggie_tracker/widgets/screens/add_to_log_screen/add_to_log_screen.dart';
import 'package:veggie_tracker/widgets/screens/list_screen/veggie_card_list.dart';

/// The list screen which displays a list of veggies available
class ListScreen extends StatelessWidget {
  /// The screen title
  static const title = 'Munch';

  @override
  Widget build(BuildContext context) {
    /// The current app state
    final appState = Provider.of<AppState>(context, listen: true);

    return AdaptivePageScaffold(
      title: title,
      child: VeggieCardList(appState.allVeggies, (id) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddToLogScreen(id),
          ),
        );
      }),
    );
  }
}
