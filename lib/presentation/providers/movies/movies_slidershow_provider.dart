import 'package:cinema_pedia/domain/entities/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'index.dart';

final moviesSliderShowProvider = Provider<List<Movie>>((ref) {
  final nowPlayinMovies = ref.watch(nowPlayingMoviesProvider);
  if (nowPlayinMovies.isEmpty) return [];

  return nowPlayinMovies.sublist(0, 6);
});
