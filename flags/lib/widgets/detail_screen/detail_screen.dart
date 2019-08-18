import 'package:flutter/material.dart';
import 'package:flags/models/country.dart';
import 'package:flags/utils/app_colors.dart';

/// The DetailScreen which displays info on a specific country
class DetailScreen extends StatelessWidget {
  /// The country to display
  final Country country;

  const DetailScreen({@required this.country, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          country.name,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: country.id,
                child: Image(
                  image: AssetImage(country.flagAssetPath),
                  fit: BoxFit.fill,
                ),
              ),
              Text(''),
              Text(
                country.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                country.capital ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: AppColors.darkGray,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
