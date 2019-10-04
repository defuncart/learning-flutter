import 'package:flutter/material.dart';

import 'package:shogi_castles/configs/app_colors.dart';
import 'package:shogi_castles/models/castle.dart';
import 'package:shogi_castles/widgets/castle_screen/shogi_board.dart';

/// The castle screen which renders the castle on a shogi board and displays info
class CastleScreen extends StatelessWidget {
  /// The castle to display
  final Castle castle;

  const CastleScreen({Key key, @required this.castle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(castle.name),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          ShogiBoard(
            boardPieces: castle.positions,
            pieceColor: AppColors.black,
            borderColor: AppColors.gray,
            // cellColor: AppColors.brown,
          ),
          Text(''),
          Text(
            castle.description,
            style: Theme.of(context).textTheme.subhead,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
