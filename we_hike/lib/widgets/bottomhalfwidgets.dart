import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:we_hike/my_api/future_model.dart';
import 'package:we_hike/widgets/ExpandableDropDown.dart';
import 'package:we_hike/widgets/SunriseSunsetRectangle.dart';
import 'package:we_hike/widgets/weatherwarnings.dart';

class bottomHalf extends StatefulWidget{

  final Forecastday weatherModel;
  final int hournow;
  final TextStyle textstyle;

  List<double> windspeed = [];
  List<double> cloudcoverage = [];
  List<double> rainfall = [];
  List<double> feelslike = [];

  void loop(){
  for (int i = 0; i < 24; i++) {
  var current = weatherModel.hour[i];
    windspeed.add(current.windMph);
    cloudcoverage.add(current.cloud.toDouble());
    rainfall.add(current.precipMm);
    feelslike.add(current.feelslikeC);
  }
  }

  bottomHalf({required this.textstyle, required this.weatherModel, required this.hournow,});

  @override
  _bottomHalf createState() => _bottomHalf();
}

class _bottomHalf extends State<bottomHalf>{

  @override
  Widget build(BuildContext context) {
  widget.loop();
    return ListView(
        padding: EdgeInsets.zero,
        children: [
          ExpandableDropDown(name: 'Feels Like (°c)' , data: widget.feelslike, hournow: widget.hournow, textstyle: widget.textstyle),
          ExpandableDropDown(name: 'Wind Speed (kmp/h)', data: widget.windspeed, hournow: widget.hournow, textstyle: widget.textstyle),
          ExpandableDropDown(name: 'Cloud Coverage (%)', data: widget.cloudcoverage, hournow: widget.hournow, textstyle: widget.textstyle),
          ExpandableDropDown(name: 'Rainfall (mm)', data: widget.rainfall, hournow: widget.hournow, textstyle: widget.textstyle),
          //WeatherWarnings(name: 'Weather Warnings', data: widget.warnings, textstyle: widget.textstyle),
        ],
    );
  }
}