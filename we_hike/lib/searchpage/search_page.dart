import 'package:flutter/material.dart';
import 'package:we_hike/homelayout/layout.dart';
import 'package:we_hike/searchpage/search_button.dart';
import 'package:we_hike/searchpage/location_button.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Icon(
        Icons.arrow_circle_left,
        color: Colors.white,
        size: 50,
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Layout(
                      key: key,
                    )));
      },
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.transparent,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/hills.jpg'),
            fit: BoxFit.cover,
          )),
          child: SafeArea(
            child: Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Align(
                    alignment: FractionalOffset(0.4, 0.025),
                    child: BackButton(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(color: const Color.fromARGB(0, 0, 0, 0)),
                ),
                const Expanded(
                  flex: 6,
                  child: MainFrame(),
                ),
                Expanded(
                  flex: 2,
                  child: Container(color: const Color.fromARGB(0, 0, 0, 0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainFrame extends StatelessWidget {
  const MainFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Padding(padding: EdgeInsets.all(120.0)),
          SearchButton(),
          Padding(padding: EdgeInsets.all(50.0)),
          LocationButton(),
        ],
      ),
    );
  }
}
