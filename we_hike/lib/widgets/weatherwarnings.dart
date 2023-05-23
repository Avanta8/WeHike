import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherWarnings extends StatefulWidget {

  final String name; // Name of the Dropdown
  final List<String> data; // Should be a list of 24 doubles, corresponding to the data for each hour of the day
  final TextStyle textstyle; // Text Styling

  WeatherWarnings({required this.name, required this.data, required this.textstyle});

  @override
  _ExpandableDropDown createState() => _ExpandableDropDown();
}

class _ExpandableDropDown extends State<WeatherWarnings> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            expanded = !expanded;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          width: MediaQuery.of(context).size.width,
          height: expanded ? MediaQuery.of(context).size.height / 4 : 80.0,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.only(
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
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.name,
                        style: widget.textstyle,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          expanded = !expanded;
                        });
                      },
                      icon: Icon(
                        expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              if (expanded)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      // Generates a text widget for each warning
                      children: List.generate(widget.data.length, (index) {
                        final warningtext = widget.data[index];

                        return Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            warningtext,
                            style: widget.textstyle,
                          ),
                        );
                      }),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
