import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:we_hike/widgets/white_text.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // This stream builder returns the correct time every second
    return StreamBuilder(
      // This stream executes takes a snapshot of the current time once per second
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        return WhiteText(text: DateFormat('HH:mm').format(DateTime.now(),),
        size: 30,
        );
      },
    );
  }
}