import 'package:flutter/material.dart';

class search_page extends StatelessWidget {
  const search_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  child: Icon(Icons.arrow_back_ios, color: Colors.blue,),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),      
              const Expanded(
                flex: 6,
                child: Text("search page")),      
              ],
          ),
        )
    );
  }
}