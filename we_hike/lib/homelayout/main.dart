import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:we_hike/search/searchPage.dart';
import 'package:we_hike/widgets/white_text.dart';
import 'package:we_hike/widgets/clock.dart';
import 'package:intl/intl.dart';
import 'package:we_hike/widgets/hourlyScroller.dart';
import 'package:we_hike/widgets/sun_times.dart';
import 'package:we_hike/widgets/current_weather_icon.dart';


class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layoutbasic',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Layout(),
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
  const Layout({
    super.key,
  });

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  // state stuff goes here
  static bool today = true;


  Widget _hourlyScroller() {
    if(today = true) {
      return Text("Today");
    }
    else {
      return Text("Tomorrow");
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
              child: Center(child: WhiteText(text: DateFormat("EEEEE dd/mm/yyyy").format(DateTime.now()).toString()))
              ),
            Expanded(
              flex: 1,
              child: GestureDetector(child: const Icon(Icons.arrow_circle_right_outlined, color: Colors.white,),
              onTap: () {
                setState(() {
                  _LayoutState.today = false;
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
                  _LayoutState.today = true;
                });
              },
              ),
              ),
            Expanded(
              flex: 4,
              child: Center(child: WhiteText(text: DateFormat("EEEEE dd/mm/yyyy").format(DateTime.now()).toString()))
              ),
            const Expanded(
              flex: 1,
              child: FittedBox()
              ),
          ],
        );
    }
  }

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
                                          MaterialPageRoute(builder: (context) => const search_page()));
                                      },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 15, 5),
                              child: Column(
                                children: const [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: ClockWidget()
                                    ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: WhiteText(text: "Current Location:"),
                                    ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: WhiteText(text: "Dartmoor",
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
                                children: const [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: WhiteText(
                                      text: "15°",
                                      size: 30
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: WhiteText(text: "Rainy", size: 25)
                                  )
                                ],
                            ),
                          ),
                        ),
                        const CurrentWeatherIcon(),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 200,
                        child: Expanded(child: HourlyScroller(),)
                      ),
                    ),

                    const SunTimes(sunriseTime: "06:07", sunsetTime: "21:42"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Expanded(
                                flex: 5,
                                child: Text("Wind speed")
                                ),
                              Expanded(
                                flex: 3,
                                child: Text("2 km/h")
                                ),
                              Expanded(
                                flex: 1,
                                child: Center(child: Text("v"))
                                )
                          ]),
                        ),
                      ),
                    ),
      
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Expanded(
                                flex: 5,
                                child: Text("Cloud Coverage")
                                ),
                              Expanded(
                                flex: 3,
                                child: Text("12%")
                                ),
                              Expanded(
                                flex: 1,
                                child: Center(child: Text("v"))
                                )
                          ]),
                        ),
                      ),
                    ),
      
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Expanded(
                                flex: 5,
                                child: Text("Chance of Rainfall")
                                ),
                              Expanded(
                                flex: 3,
                                child: Text("25%")
                                ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text("v"))
                                )
                          ]),
                        ),
                      ),
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