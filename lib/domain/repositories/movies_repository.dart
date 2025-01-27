import '../entities/index.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying();
}
