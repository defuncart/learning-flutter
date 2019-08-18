import 'package:flutter/material.dart';
import 'package:flags/models/country.dart';
import 'package:flags/services/country_service.dart';
import 'package:flags/widgets/detail_screen/detail_screen.dart';

/// The HomeScreen which displays a GridView of clickable flags
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Country> countries = CountryService.instance.countries;
    countries.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

    return Scaffold(
      appBar: AppBar(
        title: Text('Flags'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List.generate(countries.length, (index) {
          return InkResponse(
            enableFeedback: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(country: countries[index]),
                ),
              );
            },
            child: Center(
              child: Hero(
                tag: countries[index].id,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        alignment: FractionalOffset.topCenter,
                        image: AssetImage(countries[index].flagAssetPath),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
