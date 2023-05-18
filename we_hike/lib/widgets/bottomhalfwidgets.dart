import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:we_hike/widgets/ExpandableDropDown.dart';
import 'package:we_hike/widgets/SunriseSunsetRectangle.dart';
import 'package:we_hike/widgets/weatherwarnings.dart';

class bottomHalf extends StatefulWidget{

  final String sunrisetime;
  final String sunsettime;
  final List<double> windspeed;
  final List<double> cloudcoverage;
  final List<double> rainfall;
  final List<String> warnings;
  final int hournow;
  final TextStyle textstyle;

  bottomHalf({required this.sunrisetime, required this.sunsettime, required this.textstyle, required this.windspeed, required this.cloudcoverage, required this.rainfall, required this.hournow, required this.warnings});

  @override
  _bottomHalf createState() => _bottomHalf();
}

class _bottomHalf extends State<bottomHalf>{

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.zero,
        children: [
          ExpandableDropDown(name: 'Wind Speed', data: widget.windspeed, hournow: widget.hournow, textstyle: widget.textstyle),
          ExpandableDropDown(name: 'Cloud Coverage', data: widget.cloudcoverage, hournow: widget.hournow, textstyle: widget.textstyle),
          ExpandableDropDown(name: 'Rainfall', data: widget.rainfall, hournow: widget.hournow, textstyle: widget.textstyle),
          WeatherWarnings(name: 'Weather Warnings', data: widget.warnings, textstyle: widget.textstyle),
        ],
    );
  }
}