import 'package:flutter/material.dart';
import 'package:we_hike/my_api/api_calls.dart';
import 'package:we_hike/my_api/future_model.dart';
import 'package:we_hike/homelayout/home_screen.dart';


// this class starts the app by calling the Layout() method
class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Layout(),
    );
  }
}

// the Layout stateful widget contains the weather forecast model as part of its state
class Layout extends StatefulWidget {
  final Future<futureModel?>? weatherForecast;
  const Layout({
    super.key,
    this.weatherForecast,
  });

  @override
  State<Layout> createState() => _LayoutState();

  // this method checks if a weather model has been passed into Layout, and if not returns the weather in Edinburgh
  // the app therefore always checks the weather in Edinburgh when it is opened
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

  // the build method puts the widget tree onto the screen
  @override
  Widget build(BuildContext context) {

    // FutureBuilder gets the weather model and returns the weather
    // forecast home screen if there is a valid weather model
    return FutureBuilder(
      future: widget._getWeatherModel(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
        futureModel currentWeatherModel = snapshot.data!;
        return HomeScreen(currentWeatherModel: currentWeatherModel);
      }

      // if the weather model is null, the background image of the weather app
      // is shown until the weather model is returned
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