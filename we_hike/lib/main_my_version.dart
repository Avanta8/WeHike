import 'package:flutter/material.dart';

void main() {
  const headerStyle = TextStyle(color: Colors.blueAccent, fontSize: 32);
  var header = const Align(
      alignment: Alignment.bottomCenter,
      child: Text('My First Flutter App', style: headerStyle));
  var row =
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [
    Icon(Icons.wb_sunny_outlined, color: Colors.yellow, size: 50),
    Icon(Icons.waving_hand_outlined, color: Colors.green, size: 50),
    Icon(Icons.favorite, color: Colors.red, size: 50)
  ]);
  var row_mine =
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [
    Icon(Icons.wb_sunny_outlined, color: Colors.red, size: 50),
    Icon(Icons.waving_hand_outlined, color: Colors.blue, size: 50),
    Icon(Icons.favorite, color: Colors.orange, size: 50)
  ]);
  var column = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [header, row, row_mine]);

  runApp(MaterialApp(home: Scaffold(body: column)));
}
