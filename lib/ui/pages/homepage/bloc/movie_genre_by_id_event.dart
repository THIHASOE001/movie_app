part of 'movie_genre_by_id_bloc.dart';

@immutable
sealed class MovieGenreByIdEvent {}

class GetMovieGenreByIdData extends MovieGenreByIdEvent {
  final int id;

  GetMovieGenreByIdData({required this.id});
}
