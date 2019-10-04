import 'package:flutter/foundation.dart';

import 'package:shogi_castles/models/position.dart';

/// A model representing a shogi castle
class Castle {
  /// A list of board positions
  final List<Position> positions;

  /// The castle's name
  final String name;

  /// The castle's description
  final String description;

  const Castle({
    @required this.positions,
    @required this.name,
    @required this.description,
  });

  /// Returns a string representation of the model
  @override
  String toString() => '$name: $positions';
}
