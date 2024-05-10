import 'package:hive/hive.dart';
import 'package:movie_app/api_service/hive_service.dart';
import 'package:movie_app/model/popular_movie_model.dart';

Future<void> initialiseHive() async {
  //key
  const postsKey = 'posts';
  //adapters
  Hive.registerAdapter(PopularMovieAdapter());
  //box
  final postsBox = await Hive.openBox<PopularMovie?>(postsKey);
  //repos
  HiveService(postsBox: postsBox);
}
