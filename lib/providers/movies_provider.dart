import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = 'fa6551892bb3e2ed4aa22ab0f314aaf0';
  String _language = 'es-ES';
  String _page = '1';

  Map<int, List<Cast>> casting = {};

  List<Movie> onDispleyMovies = [];
  List<Movie> onPopular = [];
  List<Movie> onTopRateMovies = [];

  MoviesProvider() {
    print("provider inicializado");
    this.getOnDispleyMovies();
    this.getOnPopular();
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

  getOnPopular() async {
    print("getOnPopularMovies");

    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': _page});

    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);

    final nowPlayingPopular = NowPlayingPopular.fromJson(result.body);

    onPopular = nowPlayingPopular.results;

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

  Future<List<Cast>> getMovieCast(int idMovie) async {
    var url = Uri.https(_baseUrl, '3/movie/$idMovie/credits',
        {'api_key': _apiKey, 'language': _language});

    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);

    final creditsResponse = CreditsResponse.fromJson(result.body);

    casting[idMovie] = creditsResponse.cast;
    return creditsResponse.cast;
  }
}
