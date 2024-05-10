// ignore_for_file: public_member_api_docs, sort_constructors_first

class MoiveGenreById {
  List<dynamic> genreId;
  String title;
  String backDropPath;
  String originalTitle;
  String overView;
  String posterPath;
  String releaseDate;
  double voteAverage;
  MoiveGenreById({
    required this.genreId,
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overView,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'genre_ids': genreId,
      'title': title,
      'backdrop_path': backDropPath,
      'original_title': originalTitle,
      'overview': overView,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'vote_average': voteAverage,
    };
  }

  factory MoiveGenreById.fromJson(Map<String, dynamic> json) {
    return MoiveGenreById(
      genreId: json['genre_ids'] ?? [],
      title: json['title'] ?? '',
      backDropPath: json['backdrop_path'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overView: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      voteAverage: json['vote_average'] ?? 0.0,
    );
  }
}
