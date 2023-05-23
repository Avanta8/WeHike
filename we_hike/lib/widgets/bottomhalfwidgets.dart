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
  final Alerts alerts;

  List<double> windspeed = [];
  List<double> cloudcoverage = [];
  List<double> rainfall = [];
  List<double> feelslike = [];
  List<String> warnings = [];

  void loop(){
  // Iterates through each day on the model and extract the information
  for (int i = 0; i < 24; i++) {
  var current = weatherModel.hour[i];
    windspeed.add(current.windMph);
    cloudcoverage.add(current.cloud.toDouble());
    rainfall.add(current.precipMm);
    feelslike.add(current.feelslikeC);
  }

  // Iterate through alerts and convert to strings
  if (alerts.alert.isNotEmpty) {
    for (int i = 0; i < alerts.alert.length; i++){
      warnings.add(alerts.alert[i].toString());
    }
  } else {warnings.add("No Warnings");}
  }

  bottomHalf({required this.textstyle, required this.weatherModel, required this.hournow, required this.alerts,});

  @override
  _bottomHalf createState() => _bottomHalf();
}

class _bottomHalf extends State<bottomHalf>{

  @override
  Widget build(BuildContext context) {
  // calls the loop to initialise the inputs for each widget
  widget.loop();
    return ListView(
        padding: EdgeInsets.zero,
        // Makes a listview of each widget, and passes correct data into the widgets
        children: [
          ExpandableDropDown(name: 'Feels Like (°c)' , data: widget.feelslike, hournow: widget.hournow, textstyle: widget.textstyle),
          ExpandableDropDown(name: 'Rainfall (mm)', data: widget.rainfall, hournow: widget.hournow, textstyle: widget.textstyle),
          WeatherWarnings(name: 'Weather Warnings', data: widget.warnings, textstyle: widget.textstyle),
          ExpandableDropDown(name: 'Cloud Coverage (%)', data: widget.cloudcoverage, hournow: widget.hournow, textstyle: widget.textstyle),
          ExpandableDropDown(name: 'Wind Speed (km/h)', data: widget.windspeed, hournow: widget.hournow, textstyle: widget.textstyle),
        ],
    );
  }
}