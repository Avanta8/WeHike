import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpandableDropDown extends StatefulWidget {

  final String name; // Name of the Dropdown
  final int hournow; // The current Hour
  final List<double> data; // Should be a list of 24 doubles, corresponding to the data for each hour of the day
  final TextStyle textstyle; // Text Styling

  ExpandableDropDown({required this.name, required this.data, required this.hournow, required this.textstyle});

  @override
  _ExpandableDropDown createState() => _ExpandableDropDown();
}

class _ExpandableDropDown extends State<ExpandableDropDown> {
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
          height: expanded ? MediaQuery.of(context).size.height / 4 : 80,
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
                    Text(
                        widget.data[widget.hournow].toString(),
                        style: widget.textstyle
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
                      children: List.generate((24-widget.hournow), (index) {
                        // Iterates through the input data and generates a list of widgets, containing the time and the data at that time
                        final time = TimeOfDay(hour: widget.hournow + index, minute: 0);
                        final formattedTime =
                            '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
                        final value = widget.data[index+widget.hournow];

                        return Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  formattedTime,
                                  style: widget.textstyle,
                                ),
                              ),
                              Text(
                                '$value',
                                style: widget.textstyle,
                              ),
                              SizedBox(
                                width:48,
                                height: 20
                              ),
                            ],
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
