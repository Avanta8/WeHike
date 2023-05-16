import 'package:flutter/material.dart';

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
              color: Colors.white,
              fontFamily: 'Comfortaa',
              fontSize: size ?? 18,
            ),
    );
  }
}