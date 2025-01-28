import 'package:card_swiper/card_swiper.dart';
import 'package:cinema_pedia/domain/entities/index.dart';
import 'package:flutter/material.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;
  const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        width: double.infinity,
        child: Swiper(
          viewportFraction: 0.8,
          scale: 0.8,
          itemCount: movies.length,
          itemBuilder: (context, index) => _Slide(movie: movies[index]),
        ));
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
