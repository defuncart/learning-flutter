import 'package:flutter/material.dart';

import 'package:shogi_castles/providers/castle_provider.dart';
import 'package:shogi_castles/widgets/castle_screen/castle_screen.dart';

/// The home screen which displays a list of shogi castles
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CastleProvider.castles.length,
      itemBuilder: (_, index) => ListTile(
        title: Text(CastleProvider.castles[index].name),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CastleScreen(castle: CastleProvider.castles[index]),
          ),
        ),
      ),
    );
  }
}
