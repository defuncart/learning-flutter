import 'package:flutter/material.dart';

/// A model used to determine on which edge exteremes a board cell lies on.
class Edge {
  final bool top;
  final bool bottom;
  final bool left;
  final bool right;

  const Edge({
    @required this.top,
    @required this.bottom,
    @required this.left,
    @required this.right,
  });
}

/// Renders a board cell with a given size and text contents
class BoardCell extends StatelessWidget {
  /// The board piece as a text string
  final String boardPiece;

  /// Whether the piece belogns to sente (i.e. black, facing upwards)
  final bool sente;

  /// The cell's size (width, height)
  final double size;

  /// Which edge(s) of the board the cell lies on
  final Edge edge;

  /// The color of the piece
  final Color pieceColor;

  /// The color of the cell
  final Color cellColor;

  /// The color of the cell's border
  final Color borderColor;

  const BoardCell({
    Key key,
    @required this.boardPiece,
    @required this.sente,
    @required this.size,
    @required this.edge,
    @required this.pieceColor,
    @required this.cellColor,
    @required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final standardSide = BorderSide(width: 1, color: borderColor);
    final edgeSide = BorderSide(width: 2, color: borderColor);

    return Expanded(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border(
            top: edge.top ? edgeSide : standardSide,
            bottom: edge.bottom ? edgeSide : standardSide,
            left: edge.left ? edgeSide : standardSide,
            right: edge.right ? edgeSide : standardSide,
          ),
          color: cellColor,
        ),
        child: Center(
          child: RotatedBox(
            quarterTurns: sente ? 0 : 2,
            child: Text(
              boardPiece,
              style: Theme.of(context).textTheme.headline.copyWith(color: pieceColor),
            ),
          ),
        ),
      ),
    );
  }
}
