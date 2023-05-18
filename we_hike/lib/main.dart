import 'package:flutter/material.dart';
import 'package:we_hike/homelayout/main.dart';
import 'package:we_hike/my_api/api_calls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:we_hike/my_api/constants.dart';
import 'my_api/user_model.dart';
import 'my_api/api_service.dart';

Future<Weather_data> _getData(String userQuery) async {
    Weather_data _model = (await ApiService().getWeather("&q="+ userQuery.toString().toLowerCase() + "&aqi=no"));
    //Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
    //  _weather = _model.current.condition.text;
    //  _location  = _model.location.name;
    //  }));
    print(_model.current.condition.text);
    return _model;
  }

Future<Weather_data> _getDataFromCurrentLocation() async {
    Position currentLocation = await _getLocation();
    double currentLong = currentLocation.longitude;
    double currentLat = currentLocation.latitude;
    String LongLat = currentLong.toString() +","+ currentLat.toString();
    Weather_data _model = (await ApiService().getWeather("&q="+ LongLat.toString().toLowerCase() + "&aqi=no"));
    //Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
    //  _weather = _model.current.condition.text;
    //  _location  = _model.location.name;
    //  }));
    return _model;
  }


Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    Location location = new Location();

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the 
      // App to enable the location services.

      //this does not work
      //serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

Future<Position> _getLocation() async{
    Position position = await _determinePosition();
    return position;
  }

void main() {
  runApp(HomePage());
}

