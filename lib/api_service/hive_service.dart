import 'package:hive/hive.dart';
import 'package:movie_app/model/popular_movie_model.dart';

class HiveService {
  HiveService({required Box<PopularMovie?> postsBox}) : _postsBox = postsBox;

  final Box<PopularMovie?> _postsBox;

  Future<void> savePostsLocally({
    required List<PopularMovie> posts,
  }) async {
    for (final post in posts) {
      await _postsBox.put(post.title, post);
    }
  }

  Future<List<PopularMovie?>> fetchAllLocalPosts() async {
    final localPosts = _postsBox.values.toList();
    return localPosts;
  }
}
