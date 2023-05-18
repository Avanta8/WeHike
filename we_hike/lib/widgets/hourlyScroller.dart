import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:we_hike/widgets/current_weather_icon.dart';
import 'package:we_hike/widgets/white_text.dart';

class HourlyScroller extends StatelessWidget{
  const HourlyScroller({super.key});

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    return ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int time = 0; time <= 23;time++)
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Card(
                color: Colors.transparent,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 4.5,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                          topLeft:Radius.circular(20),
                          topRight:Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight:Radius.circular(20),
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:
                      Column(
                        children: [
                          const SizedBox(height: 15,),
                          WhiteText(text: DateFormat('HH:mm').format(DateTime(now.year,now.month,now.day,time)),),
                          const SizedBox(height: 10,),
                          //TODO API Icon code
                          const Center(child: CurrentWeatherIcon(iconCode: 113)),
                          const SizedBox(height: 20,),
                          const WhiteText(text: "15°", size: 25),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ]
    );
  }
}