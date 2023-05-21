import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class SunriseSunsetRectangle extends StatefulWidget{

  final String sunrisetime;
  final String sunsettime;
  final TextStyle textstyle;

  const SunriseSunsetRectangle({required this.sunrisetime, required this.sunsettime, required this.textstyle});

  @override
  _SunriseSunsetRectangle createState() => _SunriseSunsetRectangle();
}

class _SunriseSunsetRectangle extends State<SunriseSunsetRectangle>{

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          width: MediaQuery.of(context).size.width,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                // Creates rows and columns to show the sunrise and sunset times
                padding: const EdgeInsets.all(14.0),
                child: Row(
                    children: [
                      Column(
                          children:[
                            Text(
                              'Sunrise',
                              style: widget.textstyle,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              widget.sunrisetime,
                              style: widget.textstyle,
                              textAlign: TextAlign.left,
                            )
                          ]
                      ),
                      Spacer(),
                      Column(
                          children:[
                            Text(
                              'Sunset',
                              style: widget.textstyle,
                              textAlign: TextAlign.right,
                            ),
                            Text(
                              widget.sunsettime,
                              style: widget.textstyle,
                              textAlign: TextAlign.right,
                            )
                          ]
                      )
                    ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
