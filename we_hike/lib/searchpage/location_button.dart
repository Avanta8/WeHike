import 'package:we_hike/my_api/api_calls.dart';
import 'package:we_hike/homelayout/layout.dart';
import 'package:flutter/material.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.withOpacity(0.8),
          minimumSize: const Size(0, 60),
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: () {
          final futuremodel = getForecastFromCurrentLocation();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Layout(
                key: key,
                weatherForecast: futuremodel,
              ),
            ),
          );
        },
        icon: const Icon(Icons.my_location),
        label: const Text("Use my location"),
      ),
    );
  }
}
