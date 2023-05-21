import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:we_hike/my_api/future_model.dart';
import 'package:we_hike/searchpage/main.dart';
import 'package:we_hike/widgets/SunriseSunsetRectangle.dart';
import 'package:we_hike/widgets/bottomhalfwidgets.dart';
import 'package:we_hike/widgets/white_text.dart';
import 'package:we_hike/widgets/clock.dart';
import 'package:intl/intl.dart';
import 'package:we_hike/widgets/hourlyScroller.dart';
import 'package:we_hike/widgets/current_weather_icon.dart';


// This class contains the home screen of the app
class HomeScreen extends StatefulWidget {
  final futureModel currentWeatherModel;
  const HomeScreen({ 
    super.key,
    required this.currentWeatherModel,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  // this boolean saves whether we are looking at the weather for today or tomorrow
  static bool today = true;
  late futureModel currentWeatherModel;

  // initState gets the weather method that was passed into the HomeScreen object
  // and saves it in the currentWeatherModel variable to be used below
  @override
  void initState() {
    currentWeatherModel = widget.currentWeatherModel;
  }

  // the _hourlyScroller method returns the appropriate HourlyScroller widget
  // based on if we are looking at today or tomorrow's weather
  Widget _hourlyScroller(futureModel currentWeatherModel) {
    if(today == true) {
      return HourlyScroller(weatherModel: currentWeatherModel.forecast.forecastday[0]);
    }
    else {
      return HourlyScroller(weatherModel: currentWeatherModel.forecast.forecastday[1]);
    }
  }

  // the _getBottomHalf method returns the appropriate bottomHalf widget
  // based on if we are looking at today or tomorrow's weather
  Widget _getBottomHalf({required futureModel weatherModel}) {
    if(today == true) {
      return bottomHalf(weatherModel: weatherModel.forecast.forecastday[0], hournow: DateTime.now().hour, textstyle: const TextStyle(fontSize: 20, color: Colors.white), alerts: currentWeatherModel.alerts,);
    }
    else {
      return bottomHalf(weatherModel: weatherModel.forecast.forecastday[1], textstyle: const TextStyle(fontSize: 20, color: Colors.white), hournow: 0, alerts: currentWeatherModel.alerts,);
    }
  }

  String to24Hour(String time) {
    // Split the time string into components
    List<String> components = time.split(':');
    int hours = int.parse(components[0]);
    int minutes = int.parse(components[1].substring(0, 2));
    String period = components[1].substring(2).trim();

    // Adjust hours based on the period (AM or PM)
    if (period.toLowerCase() == 'pm' && hours < 12) {
      hours += 12;
    } else if (period.toLowerCase() == 'am' && hours == 12) {
      hours = 0;
    }

    // Format the time in 24-hour format
    String formattedTime = '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
    return formattedTime;
  }


  // returns the sunrise time for today or tomorrow as appropriate
  String _getSunriseTime({required futureModel weatherModel}) {
    if(today == true) {
      String time = to24Hour(weatherModel.forecast.forecastday[0].astro.sunrise);
      return time;
    }
    else {
      String time = to24Hour(weatherModel.forecast.forecastday[1].astro.sunrise);
      return weatherModel.forecast.forecastday[1].astro.sunrise;
    }
  }

  // returns the sunset time for today or tomorrow as appropriate
  String _getSunsetTime({required futureModel weatherModel}) {
    if(today == true) {
      String time = to24Hour(weatherModel.forecast.forecastday[0].astro.sunset);
      return time;
    }
    else {
      String time = to24Hour(weatherModel.forecast.forecastday[1].astro.sunset);
      return time;
    }
  }

  // bar at the bottom of the screen that displays the current date and 
  // allows the user to switch between data about the weather today and tomorrow
  Widget _bottomBar() {
    if(today == true) {
        return Row(
          children: [
            const Expanded(
              // this FittedBox is included to ensure the date is displayed in the centre of the screen
              flex: 1,
              child: FittedBox()
              ),
            Expanded(
              flex: 4,
              child: Center(child: WhiteText(text: DateFormat("EEEEE dd/MM/yyyy").format(currentWeatherModel.forecast.forecastday[0].date).toString()))
              ),
            Expanded(
              flex: 1,
              child: GestureDetector(child: const Icon(Icons.arrow_circle_right_outlined, color: Colors.white,),
              // we set the today boolean to false if the user clicks to view tomorrow's data
              onTap: () {
                setState(() {
                  _HomeScreenState.today = false;
                });
              },
              ),
              )
          ],
        );
    }
    else {
        return Row(
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(child: const Icon(Icons.arrow_circle_left_outlined, color: Colors.white,),
              // we set the today boolean to true if the user clicks to view today's data
              onTap: () {
                setState(() {
                  _HomeScreenState.today = true;
                });
              },
              ),
              ),
            Expanded(
              flex: 4,
              child: Center(child: WhiteText(text: DateFormat("EEEEE dd/MM/yyyy").format(currentWeatherModel.forecast.forecastday[1].date).toString()))
              ),
            const Expanded(
              flex: 1,
              child: FittedBox()
              ),
          ],
        );
    }
  }
  // this method allows flutter to display the svg file containing the magnifying glass icon
  final Widget svg = SvgPicture.asset(
  'assets/magnifying-glass-solid.svg',
  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
  semanticsLabel: 'Magnifying glass',
  alignment: Alignment.centerLeft,
  );

  // this method displays the home screen widget tree
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          // this container displays the background image, fitted to fill the whole screen without distortion
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/hills.jpg'),
                //fit: BoxFit.fitHeight,
                fit: BoxFit.cover,
                )
            ),

            // this widget allows the screen to scroll vertically
                  child: ListView(
                    children: [
                      Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                // the GestureDetector allows the magnifying glass to direct us to the search page when pressed
                                child: GestureDetector(
                                  child: SizedBox(
                                          height: 35,
                                          child: svg,
                                        ),
                                  // move to search screen
                                  onTap: () {
                                            Navigator.push(
                                              context, 
                                              MaterialPageRoute(builder: (context) => const SearchPage()));
                                          },
                                ),
                              ),
                            ),

                            // This Colum displays the user's chosen location in which to view the weather
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 15, 5),
                                  child: Column(
                                    children: [
                                      const Align(
                                        alignment: Alignment.centerRight,
                                        child: ClockWidget()
                                        ),
                                      const Align(
                                        alignment: Alignment.centerRight,
                                        child: WhiteText(text: "Current Location:"),
                                        ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: WhiteText(text: currentWeatherModel.location.name,
                                        )
                                        ),
                                    ],
                                  ),
                              ),
                            ),
                          ],
                        ),

                        // This Row displays the current temperature, weather condition, and weather icon
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: WhiteText(
                                          text: "${currentWeatherModel.current.tempC.toString()}°",
                                          size: 30
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: WhiteText(text: currentWeatherModel.current.condition.toString(), size: 25)
                                      )
                                    ],
                                ),
                              ),
                            ),
                            CurrentWeatherIcon(iconCode: currentWeatherModel.current.condition.code,),
                          ],
                        ),

                        // This box contains the HourlyScroller widget, which is obtained by calling _hourlyScroller
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 200,
                            child:  _hourlyScroller(currentWeatherModel),
                          ),
                        ),

                      // This box contains the current sunrise and sunset times
                      // Todo: get correct sunrise and sunset times!!
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              child: SunriseSunsetRectangle(sunrisetime: _getSunriseTime(weatherModel: currentWeatherModel), sunsettime: _getSunsetTime(weatherModel: currentWeatherModel), textstyle: const TextStyle(fontSize: 20, color: Colors.white))
                          )
                      ),

                      // This box contains the expanding drop down menus that show extra weather information
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: _getBottomHalf(weatherModel: currentWeatherModel),
                          )
                      ),

                  // This padding wraps the bottom bar that contains the date and today/tomorrow navigation arrows
                  Padding(padding: const EdgeInsets.all(8),
                  child: _bottomBar(),)
                  ],
                  )
                ),
          );
  }
}
