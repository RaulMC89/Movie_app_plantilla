import 'package:flutter/cupertino.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print("provider inicializado");
    this.getOnDispleyMovies();
  }
  getOnDispleyMovies() async {
    print("getOnDispleyMovies");

    var url =
        Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
