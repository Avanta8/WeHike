import 'package:flutter/material.dart';
import 'package:we_hike/homelayout/layout.dart';
import 'package:we_hike/my_api/api_calls.dart';
import 'package:we_hike/my_api/future_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/hills.jpg'),
        fit: BoxFit.fitHeight,
      )),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.green,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Layout(
                              key: key,
                            )));
              },
            ),
          ),
          Expanded(
            flex: 1, // 20%
            child: Container(color: const Color.fromARGB(0, 0, 0, 0)),
          ),
          const Expanded(
            flex: 6, // 60%
            child: MainFrame(),
          ),
          Expanded(
            flex: 2, // 20%
            child: Container(color: const Color.fromARGB(0, 0, 0, 0)),
          ),
        ],
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
        // mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // Text('A random idea:'),
          Padding(padding: EdgeInsets.all(40.0)),
          // Placeholder(),
          // Expanded(child: SearchFrame()),
          SearchFrame(),
          // Text("more text"),
          Padding(padding: EdgeInsets.all(50.0)),
          UseLocationButton(),
        ],
      ),
    );
  }
}

class SearchFrame extends StatelessWidget {
  const SearchFrame({super.key});

  @override
  Widget build(BuildContext context) {
    // return Placeholder();
    return Column(
      // padding: EdgeInsets.all(8.0),

      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: const [
        NamedSearchWidget(),
        Padding(padding: EdgeInsets.all(10)),
        CoordinateSearchWidget(),
      ],
    );
  }
}

class NamedSearchWidget extends StatelessWidget {
  const NamedSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton.icon(
        onPressed: () async {
          final navigator = Navigator.of(context);
          final selectedLocation = await showSearch(
            context: context,
            delegate: NamedSearchDelelgate(),
          );
          if (selectedLocation is String) {
            final futuremodel = getWeatherForecast(selectedLocation);
            navigator.push(
              MaterialPageRoute(
                builder: (context) => Layout(
                  key: key,
                  weatherForecast: futuremodel,
                ),
              ),
            );
            // }
          }
        },
        icon: const Icon(Icons.search),
        label: const Text("Search"),
      ),
    );
  }
}

class CoordinateSearchWidget extends StatelessWidget {
  const CoordinateSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.explore),
        label: const Text("Search Coordinates"),
      ),
    );
  }
}

class UseLocationButton extends StatelessWidget {
  const UseLocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton.icon(
        onPressed: () {
          final futuremodel = getForecastFromCurrentLocation();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Layout(
                key: key,
                weatherForecast: futuremodel,
              ),
            ),
          );
        },
        icon: const Icon(Icons.my_location),
        label: const Text("Use my location"),
      ),
    );
  }
}

class NamedSearchDelelgate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = "";
            }
          },
          icon: const Icon(Icons.clear),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) {
    // Center(child: Text(query));
    List suggestions = [
      if (query.isNotEmpty) query,
      "London",
      "China",
      "Brazil",
    ];

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;

            close(context, query);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // close(context, query);
    // return const Placeholder();
    return buildResults(context);

    //   List suggestions = [
    //     "London",
    //     "China",
    //     "Brazil",
    //   ];

    //   return ListView.builder(
    //     itemCount: suggestions.length,
    //     itemBuilder: (context, index) {
    //       final suggestion = suggestions[index];

    //       return ListTile(
    //         title: Text(suggestion),
    //         onTap: () {
    //           query = suggestion;

    //           showResults(context);
    //         },
    //       );
    //     },
    //   );
  }
}
