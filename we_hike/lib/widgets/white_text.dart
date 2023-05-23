import 'package:flutter/material.dart';

// The WhiteText class sets out some standardised text styling that can be used across the app
class WhiteText extends StatelessWidget {
  final String text;
  final double? size;

  const WhiteText({
    required this.text,
    this.size,
  });
  
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
              // white text is used in the comfortaa font
              color: Colors.white,
              fontFamily: 'Comfortaa',
              // The text size is set to 18 as default, but can be passed in as a parameter
              fontSize: size ?? 18,
            ),
    );
  }
}