import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:we_hike/my_api/api_calls.dart';
import 'package:we_hike/my_api/future_model.dart';
import 'package:we_hike/homelayout/layout.dart';


class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layoutbasic',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const Layout(),
    );
  }
}

final Widget svg = SvgPicture.asset(
  'assets/magnifying-glass-solid.svg',
  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
  semanticsLabel: 'Magnifying glass',
  alignment: Alignment.centerLeft,
);

class Layout extends StatefulWidget {
  final Future<futureModel?>? weatherForecast;
  const Layout({
    super.key,
    this.weatherForecast,
  });

  @override
  State<Layout> createState() => _LayoutState();

  Future<futureModel?>? _getWeatherModel() {
    if(weatherForecast is Future<futureModel?>) {
      return weatherForecast;
    }
    else {
      return getWeatherForecast("Edinburgh");
    }
  }
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget._getWeatherModel(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
        futureModel currentWeatherModel = snapshot.data!;
        return HomeScreen(currentWeatherModel: currentWeatherModel);
      }
      else{
        return Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/hills.jpg'),
                fit: BoxFit.fitHeight,
                )
            ),
          ),
        );
      }
      }
    );
  }
}