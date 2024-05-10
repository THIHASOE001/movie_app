import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/model/movie_genre.dart';
import 'package:movie_app/model/movie_genre_byid.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/model/popular_movie_model.dart';
import 'package:movie_app/utils/consts/api_const.dart';

class ApiService {
  Future<List<Movie>> getNowPlayingMovie() async {
    final response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/movie/now_playing')
            .replace(queryParameters: {
      "api_key": "19d6149f34738ec93c495cd0527246ae",
      "language": "en-US",
      "page": "1",
    }));

    if (response.statusCode == 200) {
      // final hasConnected = await InternetConnectionChecker().hasConnection;

      // if (!hasConnected) {
      //   debugPrint('==----====> ${posts[0]}');
      // }

      //if (posts.isNotEmpty) return posts;

      final result = jsonDecode(response.body)['results'] as List;

      await Hive.box(ApiConst.API_BOX).put("movies", result);

      final posts = Hive.box(ApiConst.API_BOX).get("movies", defaultValue: []);

      debugPrint('====----> $posts');

      debugPrint('api data====----> $result');

      return result.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Wrong');
    }
  }

  Future<List<PopularMovie>> getPopularMovie() async {
    final response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/movie/popular')
            .replace(queryParameters: {
      "api_key": "19d6149f34738ec93c495cd0527246ae",
      "language": "en-US",
      "page": "1",
    }));

    if (response.statusCode == 200) {
      final popularM =
          Hive.box(ApiConst.API_BOX).get("movies", defaultValue: []);

      debugPrint('--> ${popularM[0]}');

      final result = jsonDecode(response.body)['results'] as List;

      await Hive.box(ApiConst.API_BOX).put("popularMovie", result);

      return result.map((movie) => PopularMovie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Wrong');
    }
  }

  Future<List<Genre>> getGenreName() async {
    final response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/genre/movie/list')
            .replace(queryParameters: {
      "api_key": "19d6149f34738ec93c495cd0527246ae",
    }));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)['genres'] as List;
      return result.map((genre) => Genre.fromJson(genre)).toList();
    } else {
      throw Exception('Something Wrong');
    }
  }

  Future<List<MoiveGenreById>> getGenreNameById({required int? id}) async {
    final response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/discover/movie')
            .replace(queryParameters: {
      "with_genres": "$id",
      "api_key": "19d6149f34738ec93c495cd0527246ae",
    }));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)['results'] as List;

      debugPrint('============>${result[0]["title"]}');
      return result
          .map((genreById) => MoiveGenreById.fromJson(genreById))
          .toList();
    } else {
      throw Exception('Something Wrong');
    }
  }
}
