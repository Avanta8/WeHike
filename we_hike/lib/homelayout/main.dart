import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:we_hike/widgets/white_text.dart';
import 'package:we_hike/widgets/clock.dart';
import 'package:intl/intl.dart';

import '../widgets/hourlyScroller.dart';

void main() {
  runApp(HomePage());
}


final Widget svg = SvgPicture.asset(
  'assets/magnifying-glass-solid.svg',
  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
  semanticsLabel: 'Magnifying glass',
  alignment: Alignment.centerLeft,
);


class HomePage extends StatelessWidget {
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

class Layout extends StatelessWidget {
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
                            child: SizedBox(
                                    height: 35,
                                    child: svg,
                                  ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 15, 5),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: ClockWidget(key: key,)
                                    ),
                                  const Align(
                                    alignment: Alignment.centerRight,
                                    child: WhiteText(text: "Current Location"),
                                    ),
                                  const Align(
                                    alignment: Alignment.centerRight,
                                    child: WhiteText(text: 
                                      "Lake District",
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.blue,
                              child: const Center(child: Text("# weather icon #")),
                            ),
                          ),
                        ),
                      ],
                    ),
      
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 200,
                        child: Expanded(child: HourlyScroller(),)
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
      
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Center(child: WhiteText(text: DateFormat("EEEEE dd/mm/yyyy").format(DateTime.now()).toString())),
                                ),
                              const Expanded(
                                flex: 1,
                                child: Center(child: Text(">>"))
                                ),
                          ]),
                        ),
                      ),
                    ),
                ],
              )
            ),
      ),
      );
  }
}