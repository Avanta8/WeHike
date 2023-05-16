import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:we_hike/widgets/white_text.dart';

class HourlyScroller extends StatelessWidget{
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
              color: Colors.grey,

              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                  Column(
                    children: [
                      WhiteText(text: DateFormat('HH:mm').format(DateTime(now.year,now.month,now.day,time)),),
                      //TODO insert weather data
                    ],
                  ),
              ),
            ),
          ),
      ]
    );
  }
}