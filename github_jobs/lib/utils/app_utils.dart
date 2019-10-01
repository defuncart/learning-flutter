/// A class of utils used in the app
class AppUtils {
  /// A dictionary which maps months to ints, i.e. Jan -> 01
  static Map<String, String> _monthNamesToIntString = {
      'Jan': '01',
      'Feb': '02',
      'Mar': '03',
      'Apr': '04',
      'May': '05',
      'Jun': '06',
      'Jul': '07',
      'Aug': '08',
      'Sep': '09',
      'Oct': '10',
      'Nov': '11',
      'Dec': '12',
    };

  /// Converts a string of the format `Thu Aug 22 16:29:52 UTC 2019` into a DateTime.
  /// 
  /// Input format: `Thu Aug 22 16:29:52 UTC 2019`
  /// Format required for DateTIme to parse: `2019-08-22 16:29:52`
  static DateTime dateTimeFromCreatedAt(String createdAt) {
    final components = createdAt.split(' ');
    final dateFormat = '${components[5]}-${_monthNamesToIntString[components[1]]}-${components[2]} ${components[3]}';
    return DateTime.parse(dateFormat);
  }
}