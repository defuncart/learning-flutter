import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'package:shogi_castles/enums/piece_type.dart';
import 'package:shogi_castles/enums/player_type.dart';

/// A model representing a position on the shogi board
class Position {
  /// The row index
  final int row;

  /// The column index
  final int column;

  /// The board piece type
  final PieceType pieceType;

  /// Who the piece belongs to
  final PlayerType player;

  const Position({
    @required this.row,
    @required this.column,
    @required this.pieceType,
    this.player = PlayerType.sente,
  });

  /// Returns a string representation of the model
  @override
  String toString() => '($column, $row): ${describeEnum(player)} ${describeEnum(pieceType)}';
}
