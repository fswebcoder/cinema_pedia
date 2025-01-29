import 'package:cinema_pedia/domain/datasources/index.dart';
import 'package:cinema_pedia/domain/entities/movie.dart';
import 'package:dio/dio.dart';

import '../../config/constants/index.dart';
import '../mappers/moviedb_mapper.dart';
import '../models/moviedb/index.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3/', queryParameters: {
      'api_key': Environment.moviedbApiKey,
      'language': 'es-MX',
    }),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('movie/now_playing', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('movie/popular', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response);
  }

  List<Movie> _jsonToMovies(Response<dynamic> response) {
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDbResponse.results
        .where((movieDb) => movieDb.posterPath != 'no-poster')
        .map((movieDb) => MoviedbMapper.movieDbToEntity(movieDb))
        .toList();

    return movies;
  }
}
