part of 'popular_movie_bloc.dart';

@immutable
sealed class PopularMovieState {}

final class PopularMovieInitial extends PopularMovieState {}

final class PopularMovieLoading extends PopularMovieState {}

final class PopularMovieLoaded extends PopularMovieState {
  final List<PopularMovie> popularMovie;

  PopularMovieLoaded({required this.popularMovie});
}

final class PopularMovieError extends PopularMovieState {
  final String error;

  PopularMovieError({required this.error});
}
