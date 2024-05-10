// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/api_service/api_service.dart';

import '../../../../model/movie_genre_byid.dart';

part 'movie_genre_by_id_event.dart';
part 'movie_genre_by_id_state.dart';

class MovieGenreByIdBloc
    extends Bloc<MovieGenreByIdEvent, MovieGenreByIdState> {
  MovieGenreByIdBloc() : super(MovieGenreByIdInitial()) {
    ApiService _apiService = ApiService();
    on<GetMovieGenreByIdData>((event, emit) async {
      try {
        final data = await _apiService.getGenreNameById(id: event.id);

        emit(MovieGenreByIdLoaded(movieGenreById: data));
      } catch (e) {
        emit(MovieGenreByIdError(error: e.toString()));
      }
    });
  }
}
