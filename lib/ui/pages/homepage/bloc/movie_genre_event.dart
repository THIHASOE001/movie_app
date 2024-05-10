part of 'movie_genre_bloc.dart';

@immutable
sealed class MovieGenreEvent {}

class GetMovieGenre extends MovieGenreEvent {}
