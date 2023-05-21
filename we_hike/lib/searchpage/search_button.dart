import 'package:we_hike/my_api/api_calls.dart';
import 'package:we_hike/homelayout/layout.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.withOpacity(0.8),
          minimumSize: const Size(0, 60),
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: () async {
          final navigator = Navigator.of(context);
          final selectedLocation = await showSearch(
            context: context,
            delegate: SearchDelelgate(),
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

class SearchDelelgate extends SearchDelegate {
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
    List suggestions = [
      if (query.isNotEmpty) query,
      "London",
      "Cambridge",
      "Bristol",
      "Swansea",
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
    return buildResults(context);
  }
}
