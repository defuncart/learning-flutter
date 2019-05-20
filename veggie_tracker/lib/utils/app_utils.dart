import 'package:veggie_tracker/enums/season.dart';
import 'package:veggie_tracker/enums/category.dart';

/// A class of utils for the app
class AppUtils {
  /// A dictionary to map Category enums values to their names 
  static const Map<Category, String> _categoryNames = {
    Category.allium: 'Allium',
    Category.berry: 'Berry',
    Category.citrus: 'Citrus',
    Category.cruciferous: 'Cruciferous',
    Category.fern: 'Technically a fern',
    Category.flower: 'Flower',
    Category.fruit: 'Fruit',
    Category.fungus: 'Fungus',
    Category.gourd: 'Gourd',
    Category.leafy: 'Leafy',
    Category.legume: 'Legume',
    Category.melon: 'Melon',
    Category.root: 'Root vegetable',
    Category.stealthFruit: 'Stealth fruit',
    Category.stoneFruit: 'Stone fruit',
    Category.tropical: 'Tropical',
    Category.tuber: 'Tuber',
    Category.vegetable: 'Vegetable',
  };

  /// Converts a Category to a string name
  static String categoryToString(Category category) {
    return _categoryNames[category];
  }

  /// A dictionary to map Category enums values to their names
  static const Map<Season, String> _seasonNames = {
    Season.winter: 'Winter',
    Season.spring: 'Spring',
    Season.summer: 'Summer',
    Season.autumn: 'Autumn',
  };

  /// Converts a Season to a string name
  static String seasonToString(Season season) {
    return _seasonNames[season];
  }

  /// Converts a list of Seasons to a string name
  static String seasonsToString(List<Season> seasons) {
    var buffer = new StringBuffer();
    for(int i=0; i < seasons.length; i++) {
      if(i != 0) {
        buffer.write(', ');
      }
      buffer.write(seasonToString(seasons[i]));
    }
    return buffer.toString();
  }

  /// Tests if two dates are the same equal (ie same day, month, year)
  static bool datesAreSameDay(DateTime a, DateTime b) {
    return a?.year == b?.year && a?.month == b?.month && a?.day == b?.day;
  }
}
