import 'package:shogi_castles/enums/piece_type.dart';
import 'package:shogi_castles/models/castle.dart';
import 'package:shogi_castles/models/position.dart';

/// A provider of shogi castles
class CastleProvider {
  static const Castle _yagura = Castle(
    name: 'Yagura',
    description:
        '''Yagura is considered to be the one of the strongest defensive positions in Double Static Rook games. The castle is difficult to break down with a frontal assault, though it is weaker from the side. 
        
It is typically used against Static Rook openings that involve advancing the rook's pawn, however one's opponent, may just as easily adopt this defense, giving neither side an advantage. 
        
Note that there are many variations of Yagura, Gold Yagura is the form displayed here.''',
    positions: [
      Position(row: 8, column: 8, pieceType: PieceType.lance),
      Position(row: 8, column: 7, pieceType: PieceType.knight),
      Position(row: 7, column: 7, pieceType: PieceType.king),
      Position(row: 7, column: 6, pieceType: PieceType.gold),
      Position(row: 6, column: 8, pieceType: PieceType.pawn),
      Position(row: 6, column: 7, pieceType: PieceType.pawn),
      Position(row: 6, column: 6, pieceType: PieceType.silver),
      Position(row: 6, column: 5, pieceType: PieceType.gold),
      Position(row: 5, column: 6, pieceType: PieceType.pawn),
      Position(row: 5, column: 5, pieceType: PieceType.pawn),
      Position(row: 5, column: 4, pieceType: PieceType.pawn),
    ],
  );

  static const Castle _anaguma = Castle(
    name: 'Anaguma',
    description:
        '''Anaguma is a very common castle often used in professional shogi and which can be executed on either side of the board.''',
    positions: [
      Position(row: 8, column: 0, pieceType: PieceType.king),
      Position(row: 8, column: 1, pieceType: PieceType.knight),
      Position(row: 8, column: 2, pieceType: PieceType.gold),
      Position(row: 7, column: 0, pieceType: PieceType.lance),
      Position(row: 7, column: 1, pieceType: PieceType.silver),
      Position(row: 7, column: 2, pieceType: PieceType.gold),
      Position(row: 6, column: 0, pieceType: PieceType.pawn),
      Position(row: 6, column: 1, pieceType: PieceType.pawn),
      Position(row: 6, column: 2, pieceType: PieceType.pawn),
      Position(row: 6, column: 3, pieceType: PieceType.pawn),
    ],
  );

  static const Castle _mino = Castle(
    name: 'Mino',
    description:
        '''Mino castle may be used by both Ranging Rook and Static Rook against both Ranging Rook and Static Rook opponents respectively.
    
Although the castle can be used as is, it is often developed into a variant, depending on the opponent's formation, or even into a completely different castle altogether.''',
    positions: [
      Position(row: 8, column: 0, pieceType: PieceType.lance),
      Position(row: 8, column: 1, pieceType: PieceType.knight),
      Position(row: 8, column: 3, pieceType: PieceType.gold),
      Position(row: 7, column: 1, pieceType: PieceType.king),
      Position(row: 7, column: 2, pieceType: PieceType.silver),
      Position(row: 7, column: 4, pieceType: PieceType.gold),
      Position(row: 6, column: 1, pieceType: PieceType.pawn),
      Position(row: 6, column: 2, pieceType: PieceType.pawn),
      Position(row: 6, column: 3, pieceType: PieceType.pawn),
      Position(row: 6, column: 4, pieceType: PieceType.pawn),
      Position(row: 5, column: 0, pieceType: PieceType.pawn),
    ],
  );

  static const Castle _crab = Castle(
    name: 'Crab',
    description:
        '''Crab castle has three generals 金銀金 (gold-silver-gold) lined up next to each other in front of the king, hence the name 'crab' as the king can only move leftwards or rightwards.

The Crab castle is often used in Static Rook positions, while Ranging Rook position in Double Ranging Rook games is also possible. When playing the Yagura opening, a Crab castle is usually constructed as a strong intermediate castle in the development of a Yagura castle.''',
    positions: [
      Position(row: 8, column: 8, pieceType: PieceType.lance),
      Position(row: 8, column: 7, pieceType: PieceType.knight),
      Position(row: 8, column: 5, pieceType: PieceType.king),
      Position(row: 7, column: 6, pieceType: PieceType.gold),
      Position(row: 7, column: 5, pieceType: PieceType.silver),
      Position(row: 7, column: 4, pieceType: PieceType.gold),
      Position(row: 6, column: 8, pieceType: PieceType.pawn),
      Position(row: 6, column: 7, pieceType: PieceType.pawn),
      Position(row: 6, column: 5, pieceType: PieceType.pawn),
      Position(row: 5, column: 6, pieceType: PieceType.pawn),
      Position(row: 5, column: 4, pieceType: PieceType.pawn),
    ],
  );

  static const Castle _boat = Castle(
    name: 'Boat',
    description:
        '''Boat castle is a Static Rook castle used against Ranging Rook, which is often an intermediary step towards making stronger castles, such as Left Mino, Silver Crown or Anaguma.

This castle is often considered weak, although it is worth noting that Static Rook has the option of engaging in a rapid attack.''',
    positions: [
      Position(row: 8, column: 8, pieceType: PieceType.lance),
      Position(row: 8, column: 7, pieceType: PieceType.knight),
      Position(row: 8, column: 6, pieceType: PieceType.silver),
      Position(row: 8, column: 5, pieceType: PieceType.gold),
      Position(row: 7, column: 7, pieceType: PieceType.bishop),
      Position(row: 7, column: 6, pieceType: PieceType.king),
      Position(row: 7, column: 4, pieceType: PieceType.gold),
      Position(row: 6, column: 8, pieceType: PieceType.pawn),
      Position(row: 6, column: 7, pieceType: PieceType.pawn),
      Position(row: 6, column: 5, pieceType: PieceType.pawn),
      Position(row: 5, column: 6, pieceType: PieceType.pawn),
      Position(row: 5, column: 4, pieceType: PieceType.pawn),
    ],
  );

  static const Castle _elmo = Castle(
    name: 'Elmo',
    description:
        '''Elmo castle is a Static Rook castle used against Ranging Rook positions, originating from the elmo shogi computer engine, which was the undefeated winner of the 2017 World Computer Shogi Championship.

The castle has been subsequently used by professional shogi players and was featured in a recent strategy book.''',
    positions: [
      Position(row: 8, column: 8, pieceType: PieceType.lance),
      Position(row: 8, column: 7, pieceType: PieceType.knight),
      Position(row: 8, column: 6, pieceType: PieceType.gold),
      Position(row: 7, column: 7, pieceType: PieceType.bishop),
      Position(row: 7, column: 6, pieceType: PieceType.king),
      Position(row: 7, column: 5, pieceType: PieceType.silver),
      Position(row: 6, column: 7, pieceType: PieceType.pawn),
      Position(row: 6, column: 5, pieceType: PieceType.pawn),
      Position(row: 5, column: 8, pieceType: PieceType.pawn),
      Position(row: 5, column: 6, pieceType: PieceType.pawn),
    ],
  );

  /// A list of shogi castles
  static const List<Castle> castles = [
    _yagura,
    _anaguma,
    _mino,
    _crab,
    _boat,
    _elmo,
  ];
}
