import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:we_hike/my_api/constants.dart';
import 'package:we_hike/my_api/future_api_service.dart';
import 'package:we_hike/my_api/future_model.dart';
import 'user_model.dart';
import 'api_service.dart';

Future<Weather_data?> getData(String userQuery) async {
  Weather_data? _model = (await ApiService().getWeather("&q=" + userQuery.toString().toLowerCase() + "&aqi=no"));
  return _model;
}

Future<futureModel?> getWeatherForecast(String userQuery) async {
  futureModel? _model = (await FutureApiService()
      .getForecast("&q=" + userQuery.toString().toLowerCase() + "&days=2&aqi=no&alerts=yes"));
  return _model;
}

Future<Weather_data?> getDataFromCurrentLocation() async {
  Position currentLocation = await getLocation();
  double currentLong = currentLocation.longitude;
  double currentLat = currentLocation.latitude;
  String LatLong = currentLat.toStringAsFixed(5).toString() +
      "," +
      currentLong.toStringAsFixed(5).toString();
  Weather_data? _model = (await ApiService()
      .getWeather("&q=" + LatLong.toString().toLowerCase() + "&aqi=no"));
  return _model;
}

Future<futureModel?> getForecastFromCurrentLocation() async {
  Position currentLocation = await getLocation();
  double currentLong = currentLocation.longitude;
  double currentLat = currentLocation.latitude;
  String LatLong = currentLat.toStringAsFixed(5).toString() +
      "," +
      currentLong.toStringAsFixed(5).toString();
  futureModel? _model = (await FutureApiService()
      .getForecast("&q=" + LatLong.toString().toLowerCase() + "&days=2&aqi=no&alerts=yes"));
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
void requestPermission() async {
  bool serviceEnabled;
  LocationPermission permission;
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
}

Future<Position> getLocation() async {
  Position position = await _determinePosition();
  return position;
}
