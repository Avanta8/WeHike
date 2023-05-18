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
  static bool today = true;
  late futureModel currentWeatherModel;

  @override
  void initState() {
    currentWeatherModel = widget.currentWeatherModel;
  }

    Widget _hourlyScroller(futureModel currentWeatherModel) {
    if(today == true) {
      return HourlyScroller(weatherModel: currentWeatherModel.forecast.forecastday[0]);
    }
    else {
      return HourlyScroller(weatherModel: currentWeatherModel.forecast.forecastday[1]);
    }
  }

  Widget _getBottomHalf({required futureModel weatherModel}) {
    if(today == true) {
      return bottomHalf(weatherModel: weatherModel.forecast.forecastday[0], hournow: DateTime.now().hour, textstyle: const TextStyle(fontSize: 20, color: Colors.white),);
    }
    else {
      return bottomHalf(weatherModel: weatherModel.forecast.forecastday[1], textstyle: const TextStyle(fontSize: 20, color: Colors.white), hournow: DateTime.now().hour,);
    }
  }

  // bar at the bottom of the screen that displays the current data and 
  // allows the user to switch between data about the weather today and tomorrow
  Widget _bottomBar() {
    if(today == true) {
        return Row(
          children: [
            const Expanded(
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

  final Widget svg = SvgPicture.asset(
  'assets/magnifying-glass-solid.svg',
  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
  semanticsLabel: 'Magnifying glass',
  alignment: Alignment.centerLeft,
  );

  @override
  Widget build(BuildContext context) {
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
            child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: GestureDetector(
                                  child: SizedBox(
                                          height: 35,
                                          child: svg,
                                        ),
                                  onTap: () {
                                            // move to search screen
                                            Navigator.push(
                                              context, 
                                              MaterialPageRoute(builder: (context) => const SearchPage()));
                                          },
                                ),
                              ),
                            ),
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
                            const CurrentWeatherIcon(iconCode: 113,),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 200,
                            child:  _hourlyScroller(currentWeatherModel),
                          ),
                        ),

                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              child: SunriseSunsetRectangle(sunrisetime: '05:10', sunsettime: '20:55', textstyle: const TextStyle(fontSize: 20, color: Colors.white))
                          )
                      ),

                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: _getBottomHalf(weatherModel: currentWeatherModel),
                          )
                      ),

                        Padding(padding: const EdgeInsets.all(8),
                        child: _bottomBar(),)
                    ],
                  )
                ),
          ),
          );
  }
}
