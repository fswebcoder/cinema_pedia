import '../entities/index.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page});
  Future<List<Movie>> getPopular({int page});
  Future<List<Movie>> getUpcoming({int page});
  Future<List<Movie>> getTopRated({int page});
}
