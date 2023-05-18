import 'package:flutter/material.dart';

class CurrentWeatherIcon extends StatelessWidget {
  const CurrentWeatherIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
        child: Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 50,
            height: 50,
            child: FittedBox(
                fit: BoxFit.contain,
                child: Icon(
                  Icons.cloud, 
                  color: Colors.white,
                ),
              ),
            ),
        ),
      ),
    );
  }
}