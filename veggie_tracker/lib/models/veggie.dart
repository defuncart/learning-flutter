import 'dart:ui';
import 'package:meta/meta.dart';
import 'package:veggie_tracker/enums/category.dart';
import 'package:veggie_tracker/enums/season.dart';

/// A model representing a veggie
class Veggie {
  /// The veggie's id
  final int id;

  /// The veggie's name
  final String name;

  /// A path to the veggie's image asset
  final String imageAssetPath;

  /// The category to which the veggie belongs
  final Category category;

  /// A short, snappy description
  final String shortDescription;

  /// A color value to use when constructing UI elements to match the image found at [imageAssetPath].
  final Color accentColor;

  /// Seasons during which a veggie is harvested.
  final List<Season> seasons;

  /// Percentage of the FDA's recommended daily value of vitamin A for someone with a 2,000 calorie diet
  final int vitaminAPercentage;

  /// Percentage of the FDA's recommended daily value of vitamin C for someone with a 2,000 calorie diet
  final int vitaminCPercentage;

  /// A text description of a single serving (e.g. '1 apple' or '1/2 cup')
  final String servingSize;

  /// Calories per serving (as described in [servingSize])
  final int caloriesPerServing;

  /// Constructor
  Veggie({
    @required this.id,
    @required this.name,
    @required this.imageAssetPath,
    @required this.category,
    @required this.shortDescription,
    @required this.accentColor,
    @required this.seasons,
    @required this.vitaminAPercentage,
    @required this.vitaminCPercentage,
    @required this.servingSize,
    @required this.caloriesPerServing,
  });
}
