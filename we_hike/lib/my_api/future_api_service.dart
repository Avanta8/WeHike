import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'future_model.dart';

class FutureApiService {
  Future<futureModel?> getForecast(String userSearch) async {
    //try {
    var url = Uri.parse(
        ApiConstants.futureBaseUrl + ApiConstants.usersEndpointFuture);
    if (userSearch != "") {
      url = Uri.parse(ApiConstants.futureBaseUrl + userSearch);
    }
    print("this is getting run api service");
    print(url.toString());
    print("this was the url");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print("diagnostic_1");
      futureModel _model = futureModelFromJson(response.body);
      print('Diagnostic_2');
      return _model;
    }
    //} catch (e) {
    //  print("issue");
    //  log(e.toString());
    //  print(e);
    //}
    return null;
    Condition temporary_condition =
        Condition(text: "NoWhere", icon: "NoWhere", code: 0);
    Current temporary_current = Current(
        lastUpdatedEpoch: 0,
        lastUpdated: "Nowhere",
        tempC: 0,
        tempF: 0,
        isDay: 0,
        condition: temporary_condition,
        windMph: 0,
        windKph: 0,
        windDegree: 0,
        windDir: "Nowhere",
        pressureMb: 0,
        pressureIn: 0,
        precipMm: 0,
        precipIn: 0,
        humidity: 0,
        cloud: 0,
        feelslikeC: 0,
        feelslikeF: 0,
        visKm: 0,
        visMiles: 0,
        uv: 0,
        gustMph: 0,
        gustKph: 0);
    Location_json temporary_location = Location_json(
        name: "NoWhere",
        region: "NoWhere",
        country: "NoWhere",
        lat: 0.0,
        lon: 0.0,
        tzId: "NoWhere",
        localtimeEpoch: 0,
        localtime: "NoWhere");
    Day temporary_day = Day(
        maxtempC: 0,
        maxtempF: 0,
        mintempC: 0,
        mintempF: 0,
        avgtempC: 0,
        avgtempF: 0,
        maxwindMph: 0,
        maxwindKph: 0,
        totalprecipMm: 0,
        totalprecipIn: 0,
        totalsnowCm: 0,
        avgvisKm: 0,
        avgvisMiles: 0,
        avghumidity: 0,
        dailyWillItRain: 0,
        dailyChanceOfRain: 0,
        dailyWillItSnow: 0,
        dailyChanceOfSnow: 0,
        condition: temporary_condition,
        uv: 0);
    Astro temporary_astro = Astro(
        sunrise: "NoWhere",
        sunset: "NoWhere",
        moonrise: "NoWhere",
        moonset: "NoWhere",
        moonPhase: "NoWhere",
        moonIllumination: "NoWhere",
        isMoonUp: 0,
        isSunUp: 0);
    Hour temporary_hour = Hour(
        timeEpoch: 0,
        time: "NoWhere",
        tempC: 0,
        tempF: 0,
        isDay: 0,
        condition: temporary_condition,
        windMph: 0,
        windKph: 0,
        windDegree: 0,
        windDir: "NoWhere",
        pressureMb: 0,
        pressureIn: 0,
        precipMm: 0,
        precipIn: 0,
        humidity: 0,
        cloud: 0,
        feelslikeC: 0,
        feelslikeF: 0,
        windchillC: 0,
        windchillF: 0,
        heatindexC: 0,
        heatindexF: 0,
        dewpointC: 0,
        dewpointF: 0,
        willItRain: 0,
        chanceOfRain: 0,
        willItSnow: 0,
        chanceOfSnow: 0,
        visKm: 0,
        visMiles: 0,
        gustMph: 0,
        gustKph: 0,
        uv: 0);
    List<Hour> temporary_hour_list = {temporary_hour} as List<Hour>;
    Forecastday temporary_forecastday = Forecastday(
        date: DateTime.now(),
        dateEpoch: 0,
        day: temporary_day,
        astro: temporary_astro,
        hour: temporary_hour_list);
    List<Forecastday> temporary_day_list = {temporary_day} as List<Forecastday>;
    Forecast temporary_forecast = Forecast(forecastday: temporary_day_list);
    return futureModel(
        location: temporary_location,
        current: temporary_current,
        forecast: temporary_forecast);
  }
}
