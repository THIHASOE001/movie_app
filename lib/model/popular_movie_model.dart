// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive_flutter/adapters.dart';

part 'popular_movie_model.g.dart';

@HiveType(typeId: 0)
class PopularMovie {
  @HiveField(0)
  String title;
  @HiveField(1)
  String backDropPath;
  @HiveField(2)
  String originalTitle;
  @HiveField(3)
  String overView;
  @HiveField(4)
  String posterPath;
  @HiveField(5)
  String releaseDate;
  @HiveField(6)
  double voteAverage;
  @HiveField(7)
  int id;
  PopularMovie({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overView,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'backdrop_path': backDropPath,
      'original_title': originalTitle,
      'overview': overView,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'vote_average': voteAverage,
      'id': id,
    };
  }

  factory PopularMovie.fromJson(Map<String, dynamic> json) {
    return PopularMovie(
      title: json['title'] ?? '',
      backDropPath: json['backdrop_path'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overView: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      voteAverage: json['vote_average'] ?? 0.0,
      id: json['id'] ?? 0,
    );
  }
}
