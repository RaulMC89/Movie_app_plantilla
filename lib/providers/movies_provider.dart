import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = 'fa6551892bb3e2ed4aa22ab0f314aaf0';
  String _language = 'es-ES';
  String _page = '1';

  List<Movie> onDispleyMovies = [];
  List<Movie> onPopularMovies = [];
  List<Movie> onTopRateMovies = [];

  MoviesProvider() {
    print("provider inicializado");
    this.getOnDispleyMovies();
    this.getOnPopularMovies();
    this.getOnTopRatedMovies();
  }

  getOnDispleyMovies() async {
    //print("getOnDispleyMovies");

    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': _page});

    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);

    final nowPlayingResponse = NowPlayingResponse.fromJson(result.body);

    onDispleyMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getOnPopularMovies() async {
    print("getOnPopularMovies");

    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': _page});

    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);

    final nowPlayingPopular = NowPlayingPopular.fromJson(result.body);

    onPopularMovies = nowPlayingPopular.results;

    notifyListeners();
    print("getOnPopularMovies");
  }

  getOnTopRatedMovies() async {
    print("getOnPopularMovies");

    var url = Uri.https(_baseUrl, '3/movie/top_rated',
        {'api_key': _apiKey, 'language': _language, 'page': _page});

    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);

    final nowPlayingPopular = NowPlayingPopular.fromJson(result.body);

    onTopRateMovies = nowPlayingPopular.results;

    notifyListeners();
    print("getOnPopularMovies");
  }
}
