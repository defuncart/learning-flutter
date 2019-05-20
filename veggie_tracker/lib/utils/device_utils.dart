import 'package:flutter/foundation.dart';

/// A class of device utils
class DeviceUtils {
  /// whether the device is iOS
  static bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;
}
