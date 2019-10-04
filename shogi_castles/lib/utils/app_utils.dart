import 'package:flutter/material.dart';

import 'package:shogi_castles/enums/piece_type.dart';
import 'package:shogi_castles/enums/player_type.dart';
import 'package:shogi_castles/models/position.dart';

/// A class of util methods used in the app
class AppUtils {
  /// The number of rows on a shogi board
  static const int numberRows = 9;

  /// The number of columns on a shogi board
  static const int numberColumns = 9;

  /// Returns a string representaion of the piece at position (row, column)
  static String pieceStringAtPosition(List<Position> boardPieces, int row, int column) {
    final result = boardPieces.where((piece) => piece.row == row && piece.column == column);
    return result.isNotEmpty ? _pieceTypeToString(result.first.pieceType) : '';
  }

  /// Returns whether the piece at position (row, column) belongs to sente or not
  static bool pieceDirectionAtPosition(List<Position> boardPieces, int row, int column) {
    final result = boardPieces.where((piece) => piece.row == row && piece.column == column);
    return result.isNotEmpty ? result.first.player == PlayerType.sente : true;
  }

  /// Maps piece type to Japanese characters
  static const Map<PieceType, String> _piecesJP = {
    PieceType.king: '玉',
    PieceType.gold: '金',
    PieceType.silver: '銀',
    PieceType.knight: '桂',
    PieceType.lance: '香',
    PieceType.bishop: '角',
    PieceType.rook: '飛',
    PieceType.pawn: '歩',
  };

  /// Maps piece type to English letters
  static const Map<PieceType, String> _piecesEN = {
    PieceType.king: 'K',
    PieceType.gold: 'G',
    PieceType.silver: 'S',
    PieceType.knight: 'N',
    PieceType.lance: 'L',
    PieceType.bishop: 'B',
    PieceType.rook: 'R',
    PieceType.pawn: 'P',
  };

  /// Converts a piece type to string
  static String _pieceTypeToString(PieceType pieceType) => _piecesJP[pieceType];

  /// Converts a string to piece type
  static PieceType _pieceStringToString(String pieceString) =>
      _piecesJP.entries.where((p) => p.value == pieceString).first.key;

  /// Determines a text theme with a single text color for all styles
  static TextTheme textThemeWithSingleColor(Color color) => TextTheme(
        body1: TextStyle(),
        body2: TextStyle(),
        display1: TextStyle(),
        display2: TextStyle(),
        display3: TextStyle(),
        display4: TextStyle(),
        headline: TextStyle(),
        title: TextStyle(),
        subhead: TextStyle(),
        subtitle: TextStyle(),
      ).apply(
        bodyColor: color,
        displayColor: color,
      );
}
