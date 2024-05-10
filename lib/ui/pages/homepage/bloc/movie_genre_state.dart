part of 'movie_genre_bloc.dart';

@immutable
sealed class MovieGenreState {}

final class MovieGenreInitial extends MovieGenreState {}

final class MovieGenreLoading extends MovieGenreState {}

final class MovieGenreLoaded extends MovieGenreState {
  final List<Genre> genre;

  MovieGenreLoaded({required this.genre});
}

final class MovieGenreError extends MovieGenreState {
  final String error;
  MovieGenreError({required this.error});
}
