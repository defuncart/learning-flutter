import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:shogi_castles/models/position.dart';
import 'package:shogi_castles/utils/app_utils.dart';
import 'package:shogi_castles/widgets/castle_screen/board_cell.dart';

/// Renders a shogi board using a list of board pieces
class ShogiBoard extends StatelessWidget {
  /// The number of rows on the board
  static const int numberRows = AppUtils.numberRows;

  /// The number of columns on the board
  static const int numberColumns = AppUtils.numberColumns;

  /// A list of board pieces
  final List<Position> boardPieces;

  /// The color of each piece on the board
  final Color pieceColor;

  /// The color of each cell on the board
  final Color cellColor;

  /// The color of each cell's border
  final Color borderColor;

  const ShogiBoard({
    @required this.boardPieces,
    this.pieceColor = Colors.black87,
    this.cellColor = Colors.transparent,
    this.borderColor = Colors.black54,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final size = (constraints.hasBoundedWidth ? constraints.maxWidth : constraints.maxHeight) / numberRows;

        List<Widget> rows = List<Widget>(numberRows);
        for (int y = 0; y < numberRows; y++) {
          List<Widget> row = List<Widget>(numberColumns);
          for (int x = numberColumns - 1; x >= 0; x--) {
            // print('x: $x, y: $y, ${AppUtils.castlePieceAtPosition(castle, y, x)}');
            row[numberColumns - 1 - x] = BoardCell(
              boardPiece: AppUtils.pieceStringAtPosition(boardPieces, y, x),
              sente: AppUtils.pieceDirectionAtPosition(boardPieces, y, x),
              size: size,
              edge: Edge(
                top: y == 0,
                bottom: y == numberRows - 1,
                left: x == numberColumns - 1,
                right: x == 0,
              ),
              pieceColor: pieceColor,
              cellColor: cellColor,
              borderColor: borderColor,
            );
          }
          rows[y] = Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: row,
          );
        }

        return AspectRatio(
          aspectRatio: 1.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: rows,
          ),
        );
      },
    );
  }
}
