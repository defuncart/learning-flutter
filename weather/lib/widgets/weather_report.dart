import 'package:flutter/material.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/utils/weather_utils.dart';
import 'package:weather/widgets/gradient_container.dart';

class WeatherReport extends StatelessWidget {
  /// The weather model
  final Weather weather;

  /// Constructor
  const WeatherReport({Key key, @required this.weather}) : super(key: key);

  /// Builds the widget
  @required
  Widget build(BuildContext context) {
    return GradientContainer(
      color: WeatherUtils.weatherConditionToBackgroundColor(weather.condition),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
            ),
            Text(
              weather.city,
              style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white),
            ),
            Text(
              'Updated: ${TimeOfDay.fromDateTime(weather.lastUpdated).format(context)}',
              style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white),
            ),
            Container(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset(
                  WeatherUtils.weatherConditionToImageFilepath(weather.condition),
                ),
                Text(
                  '${weather.temp}°',
                  style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'max: ${weather.maxTemp}°',
                      style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white),
                    ),
                    Text(
                      'min: ${weather.minTemp}°',
                      style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
