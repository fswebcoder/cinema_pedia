import 'package:cinema_pedia/domain/entities/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../index.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieInfoProvider, Map<String, Movie>>((ref) {
  final movieReposity = ref.watch(movieRepositoryProvider);
  return MovieInfoProvider(getMovie: movieReposity.getMovieById);
});

typedef GetMovieCallBack = Future<Movie> Function(String movieId);

class MovieInfoProvider extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallBack getMovie;

  MovieInfoProvider({required this.getMovie}) : super({});

  Future<void> loadMovie(String mivieId) async {
    if (state[mivieId] != null) return;
    print("Loading movie $mivieId");
    final movie = await getMovie(mivieId);
    state = {...state, mivieId: movie};
  }
}
