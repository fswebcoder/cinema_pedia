import 'package:cinema_pedia/domain/datasources/index.dart';
import 'package:cinema_pedia/domain/entities/movie.dart';
import 'package:dio/dio.dart';

import '../../config/constants/index.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3/', queryParameters: {
      'api_key': Environment.moviedbApiKey,
      'language': 'es-MX',
    }),
  );

  @override
  Future<List<Movie>> getNowPlaying() async {
    final response = await dio.get('movie/now_playing');
    final List<Movie> movies = [];

    return movies;
  }
}
