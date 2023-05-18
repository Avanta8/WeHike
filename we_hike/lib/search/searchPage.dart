import 'package:flutter/material.dart';
import 'package:we_hike/homelayout/main.dart';

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
                  child: const Icon(Icons.arrow_back_ios, color: Colors.green,),
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => Layout(key: key)));
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