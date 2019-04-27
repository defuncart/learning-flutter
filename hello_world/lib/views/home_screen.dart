import 'package:flutter/material.dart';
import 'package:hello_world/service/name_generator.dart';

/// The home screen
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

/// The home screen's state
class _HomeScreenState extends State<HomeScreen> {
  /// A name generator
  final NameGenerator _nameGenerator = NameGenerator();

  /// A list of (generated) names
  final _names = <String>[];

  /// A set of names which have been saved
  final _saved = Set<String>();

  /// A text style with a larger font
  final _biggerFont = const TextStyle(fontSize: 18.0);

  /// Build the view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  /// Builds a never-ending list of suggestions
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _names.length) {
            _names.addAll(_nameGenerator.generateNames(10));
          }
          return _buildRow(_names[index]);
        });
  }

  /// Builds a name suggestion row
  Widget _buildRow(String name) {
    final bool alreadySaved = _saved.contains(name);
    return ListTile(
      title: Text(
        name,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(name);
          } else {
            _saved.add(name);
          }
        });
      },
    );
  }

  /// Callback when the list button is pressed, show saved suggestions.
  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (String name) {
              return ListTile(
                title: Text(
                  name,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
