import 'package:flutter/material.dart';
import 'package:we_hike/homelayout/main.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layoutbasic',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: WeatherApp(key: key),
    );
  }
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({
     super.key,
      });

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  // state goes here
  static var currentLocation = "London";
  static var currentWeather;
  static var weatherList;

  @override
  Widget build(BuildContext context) {
    return Layout(location: currentLocation,);
  }
}
