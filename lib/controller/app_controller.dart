import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AppController extends ChangeNotifier {
  final baseUrl = "https://api.themoviedb.org/3/movie/popular";
  final api = "8d06e8645d31b61bdb9e5d785557a580";

  //to get all popular movie
  Future<void> getPopularMovies() async {
    var response = await http.get(Uri.parse("$baseUrl?api_key=$api"));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("dataResponse: ${response.body}");
    }
  }
}
