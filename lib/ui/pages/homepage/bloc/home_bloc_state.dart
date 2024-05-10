part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

final class HomeBlocLoading extends HomeBlocState {}

final class HomeBlocLoaded extends HomeBlocState {
  final List<Movie> movie;

  HomeBlocLoaded({required this.movie});
}

final class HomeBLocError extends HomeBlocState {
  final String error;

  HomeBLocError({required this.error});
}
