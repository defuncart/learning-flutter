import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/states/app_state.dart';

// /// A navigation drawer (which slides out to displays info on the user)
class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// A list of cities
    final List<String> _cities = ['Berlin', 'Dublin', 'Istanbul', 'London', 'New York', 'Paris', 'Rome', 'Tokyo'];

    /// The app state
    final AppState _cityState = Provider.of<AppState>(context);

    // draw the widget
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            height: 25,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _cities.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(_cities[index]),
                    onTap: () {
                      _cityState.currentCity = _cities[index];
                      Navigator.of(context).pop();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
