part of 'popular_movie_bloc.dart';

@immutable
sealed class PopularMovieEvent {}

class GetPopularData extends PopularMovieEvent {}
