import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api_service/api_service.dart';
import 'package:movie_app/model/movie_model.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final ApiService apiService = ApiService();

  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeBlocData>((event, emit) async {
      try {
        final data = await apiService.getNowPlayingMovie();
        emit(HomeBlocLoaded(movie: data));
      } catch (e) {
        HomeBLocError(error: e.toString());
      }
    });
  }
}
