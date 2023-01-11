import 'dart:convert';

import 'package:flutter_netflix/extension/function+extension.dart';
import 'package:flutter_netflix/model/Movie.dart';
import 'package:flutter_netflix/screens/home/viewmodel/home_section.dart';
import 'package:flutter_netflix/utils/util.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeRespository {
  Future<List<Movie>> getTrendingMovies(
      {GenericFunction<bool>? onRequesting = null,
      HomeSectionType homeSectionType = HomeSectionType.netflix}) async {
    onRequesting?.call(true);
    final uri = Uri.https(
        BASE_URL, homeSectionType.getEndPoint(), homeSectionType.getHeader());
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var results = body["results"];
      if (results != null) {
        onRequesting?.call(false);
        return (results as List<dynamic>)
            .map((e) => Movie.fromJson(e))
            .toList();
      }
    }
    onRequesting?.call(true);
    return [];
  }
}
