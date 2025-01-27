import 'package:cinema_pedia/domain/entities/movie.dart';

import '../models/moviedb/index.dart';

class MoviedbMapper {
  static Movie movieDbToEntity(MovieMovieDb movieMovieDb) => Movie(
        adult: movieMovieDb.adult,
        backdropPath: (movieMovieDb.backdropPath != '')
            ? 'https://image.tmdb.org/t/p/w500/${movieMovieDb.backdropPath}'
            : 'https://www.smaroadsafety.com/wp-content/uploads/2022/06/no-pic.png',
        genreIds: movieMovieDb.genreIds.map((e) => e.toString()).toList(),
        id: movieMovieDb.id,
        originalLanguage: movieMovieDb.originalLanguage,
        originalTitle: movieMovieDb.originalTitle,
        overview: movieMovieDb.overview,
        popularity: movieMovieDb.popularity,
        posterPath: (movieMovieDb.posterPath != '')
            ? 'https://image.tmdb.org/t/p/w500/${movieMovieDb.posterPath}'
            : 'https://www.smaroadsafety.com/wp-content/uploads/2022/06/no-pic.png',
        releaseDate: movieMovieDb.releaseDate,
        title: movieMovieDb.title,
        video: movieMovieDb.video,
        voteAverage: movieMovieDb.voteAverage,
        voteCount: movieMovieDb.voteCount,
      );
}
