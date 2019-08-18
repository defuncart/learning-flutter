import 'package:flutter/material.dart';
import 'package:flags/services/country_service.dart';
import 'package:flags/widgets/my_app.dart';

/// App entry point
void main() async {
  // wait until CountryService singleton has been initialized
  await CountryService.instance.init();
  // then render app
  runApp(MyApp());
}
