import 'package:flutter/material.dart';
import 'package:we_hike/widgets/white_text.dart';

class SunTimes extends StatelessWidget {
  final String sunsetTime;
  final String sunriseTime;
  const SunTimes(
    {super.key, 
    required this.sunriseTime, 
    required this.sunsetTime}
  ); 
  
  // This method displays the sunrise and sunset times in a row
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
      child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const WhiteText(text: "Sunrise"),
                    WhiteText(text: sunriseTime)
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const WhiteText(text: "Sunset"),
                    WhiteText(text: sunsetTime)
                  ],
                ),
              )
            ],
      ),
    );
  }
}