import 'dart:ui';

import 'package:meta/meta.dart';

/// A config of colors used in the app
class AppColors {
  static const light = ColorThemeModel(
    background: const Color(0xFFf7d794),
    backgroundHighlighted: const Color(0xFFf5cd79),
    text: const Color(0xFF4b4b4b),
    textHighlighted: const Color(0xFFff4d4d),
  );

  static const dark = ColorThemeModel(
    background: const Color(0xFF3d3d3d),
    backgroundHighlighted: const Color(0xFF2f2f2f),
    text: const Color(0xFFecf0f1),
    textHighlighted: const Color(0xFFff4d4d),
  );
}

/// A model representing a color theme
class ColorThemeModel {
  final Color background;
  final Color backgroundHighlighted;
  final Color text;
  final Color textHighlighted;

  const ColorThemeModel({
    @required this.background,
    @required this.backgroundHighlighted,
    @required this.text,
    @required this.textHighlighted,
  });
}
