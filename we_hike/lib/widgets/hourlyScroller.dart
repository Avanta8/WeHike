import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:we_hike/widgets/current_weather_icon.dart';
import 'package:we_hike/widgets/white_text.dart';

import '../my_api/future_model.dart';

class HourlyScroller extends StatelessWidget{
  const HourlyScroller({super.key, required this.weatherModel});
  final Forecastday weatherModel;

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    int time;
    //makes the cards go only from the current hour onwards
    if (now.day >= weatherModel.date.day)
    {
      time = now.hour;
    }
    else{
      time = 0;
    }
    List<Hour> hourlyList = weatherModel.hour;
    return ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = time; i <= 23;i++)
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Card(
                color: Colors.transparent,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 4.5,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        //making the cards rounded on the corners
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
                          //centering and separating the data on the cards
                          const SizedBox(height: 15,),
                          WhiteText(text: DateFormat('HH:mm').format(DateTime(now.year,now.month,now.day,i)),),
                          const SizedBox(height: 10,),
                          Center(child: CurrentWeatherIcon(iconCode: hourlyList[i].condition.code,)),
                          const SizedBox(height: 20,),
                          WhiteText(text: hourlyList[i].tempC.round().toString()+"°", size: 25),
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