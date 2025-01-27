import 'package:cinema_pedia/infraestructure/repositories/movie_repository_imp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infraestructure/datasources/moviedb_datasource.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImp(MoviedbDatasource());
});
