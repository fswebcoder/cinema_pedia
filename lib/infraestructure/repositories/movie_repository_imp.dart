import 'package:cinema_pedia/domain/datasources/index.dart';
import 'package:cinema_pedia/domain/entities/movie.dart';
import 'package:cinema_pedia/domain/repositories/index.dart';

class MovieRepositoryImp extends MoviesRepository {
  final MoviesDatasource _moviesDatasource;

  MovieRepositoryImp(this._moviesDatasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return _moviesDatasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return _moviesDatasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return _moviesDatasource.getUpcoming(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return _moviesDatasource.getTopRated(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return _moviesDatasource.getMovieById(id);
  }
}
