// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/api_service/api_service.dart';
import 'package:movie_app/model/popular_movie_model.dart';
part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  PopularMovieBloc() : super(PopularMovieInitial()) {
    ApiService apiService = ApiService();
    on<GetPopularData>((event, emit) async {
      try {
        final data = await apiService.getPopularMovie();
        emit(PopularMovieLoaded(popularMovie: data));
      } catch (e) {
        emit(PopularMovieError(error: e.toString()));
      }
    });
  }
}
