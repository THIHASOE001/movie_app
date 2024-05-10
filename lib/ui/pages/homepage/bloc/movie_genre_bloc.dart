import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/api_service/api_service.dart';
import 'package:movie_app/model/movie_genre.dart';

part 'movie_genre_event.dart';
part 'movie_genre_state.dart';

class MovieGenreBloc extends Bloc<MovieGenreEvent, MovieGenreState> {
  MovieGenreBloc() : super(MovieGenreInitial()) {
    ApiService apiService = ApiService();

    on<GetMovieGenre>((event, emit) async {
      try {
        final genre = await apiService.getGenreName();
        emit(MovieGenreLoaded(genre: genre));
      } catch (e) {
        emit(MovieGenreError(error: e.toString()));
      }
    });
  }
}
