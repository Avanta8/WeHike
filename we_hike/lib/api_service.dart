import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'user_model.dart';

class ApiService {
  Future<Weather_data> getUsers() async {
    //try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      print("this is getting run api service");
      print(url.toString());
      print("this is getting run again");
      var response = await http.get(url);
      print("this is getting run again");
      print(response.toString());
      if (response.statusCode == 200) {
        print("diagnostic_1");
        Weather_data _model = Weather_dataFromJson(response.body);
        print('Diagnostic_2');
        return _model;
      }
    //} catch (e) {
      //print(response.toString());
      //print("issue");
      //log(e.toString());
      //print(e);
    //}
    Condition temporary_condition =  Condition(text: "NoWhere", icon: "NoWhere", code: 0);
    Current temporary_current = Current(lastUpdatedEpoch: 0, lastUpdated : "Nowhere", tempC: 0, tempF: 0, isDay: 0, condition: temporary_condition, windMph: 0, windKph: 0, windDegree: 0, windDir: "Nowhere", pressureMb: 0, pressureIn: 0, precipMm: 0, precipIn: 0, humidity: 0, cloud: 0, feelslikeC: 0, feelslikeF: 0, visKm: 0, visMiles: 0, uv: 0, gustMph: 0, gustKph: 0);
    Location_json temporary = Location_json(name: "NoWhere", region: "NoWhere", country: "NoWhere", lat: 0.0, lon: 0.0, tzId: "NoWhere", localtimeEpoch: 0, localtime: "NoWhere");
    return Weather_data(location: temporary, current: temporary_current);
  }
}