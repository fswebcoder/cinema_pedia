import 'package:cinema_pedia/presentation/providers/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/movies/index.dart';
import '../../widgets/share/index.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoadin = ref.watch(initialLoagingProvider);
    if (initialLoadin) return FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSliderShowProvider);
    final popularmoviesProvider = ref.watch(popularMoviesProvider);
    final upcomingmoviesProvider = ref.watch(upcomingMoviesProvider);
    final topratedMoviesProvider = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          background: CustomAppbar(),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              children: [
                MoviesSlideshow(movies: slideShowMovies),
                MovieHorizontalListview(
                  movies: nowPlayingMovies,
                  tittle: 'En cines',
                  sunTitle: 'Lunes 20',
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListview(
                  movies: popularmoviesProvider,
                  tittle: 'Popular',
                  sunTitle: 'Este mes',
                  loadNextPage: () {
                    ref.read(popularMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListview(
                  movies: upcomingmoviesProvider,
                  tittle: 'Próximamente',
                  sunTitle: 'Este mes',
                  loadNextPage: () {
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListview(
                  movies: topratedMoviesProvider,
                  tittle: 'Mejor valoradas',
                  loadNextPage: () {
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                  },
                ),
              ],
            );
          },
          childCount: 1,
        ),
      )
    ]);
  }
}
