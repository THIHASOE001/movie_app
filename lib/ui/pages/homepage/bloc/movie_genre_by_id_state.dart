part of 'movie_genre_by_id_bloc.dart';

@immutable
sealed class MovieGenreByIdState {}

final class MovieGenreByIdInitial extends MovieGenreByIdState {}

final class MovieGenreByIdLoading extends MovieGenreByIdState {}

final class MovieGenreByIdLoaded extends MovieGenreByIdState {
  final List<MoiveGenreById> movieGenreById;

  MovieGenreByIdLoaded({required this.movieGenreById});
}

final class MovieGenreByIdError extends MovieGenreByIdState {
  final String error;

  MovieGenreByIdError({required this.error});
}
