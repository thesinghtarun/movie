// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AppController extends ChangeNotifier {
  final baseUrlPopularMovies = "https://api.themoviedb.org/3/movie/popular";
  final baseUrlNowPlaying = "https://api.themoviedb.org/3/movie/now_playing";
  final api = "8d06e8645d31b61bdb9e5d785557a580";

  //to get all popular movie
  var popularMoviesdata;
  Future<void> getPopularMovies() async {
    var response =
        await http.get(Uri.parse("$baseUrlPopularMovies?api_key=$api"));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      popularMoviesdata = data["results"];
      print("dataResponse: ${popularMoviesdata[2]["original_title"]}");
    }
  }

  var nowPlayingMoviesData;
  Future<void> nowPlayingMovies() async {
    var response =
        await http.get(Uri.parse("$baseUrlNowPlaying?api_key=$api"));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      nowPlayingMoviesData = data["results"];
      print("dataResponseNow: ${nowPlayingMoviesData[2]["original_title"]}");
    }
  }
}
