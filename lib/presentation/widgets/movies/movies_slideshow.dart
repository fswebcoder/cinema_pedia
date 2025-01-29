import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinema_pedia/domain/entities/index.dart';
import 'package:flutter/material.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;
  const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
        height: 200,
        width: double.infinity,
        child: Swiper(
          itemWidth: 300,
          itemHeight: 200,
          viewportFraction: 0.8,
          autoplay: true,
          scale: 0.8,
          itemCount: movies.length,
          pagination: SwiperPagination(
            margin: const EdgeInsets.only(top: 5),
            builder: DotSwiperPaginationBuilder(
              color: colors.secondary,
              activeColor: colors.primary,
              activeSize: 10,
              space: 2,
            ),
          ),
          itemBuilder: (context, index) => _Slide(movie: movies[index]),
        ));
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 10),
          )
        ]);
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            movie.posterPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return const DecoratedBox(
                    decoration: BoxDecoration(color: Colors.black45));
              }
              return FadeIn(child: child);
            },
          ),
        ),
      ),
    );
  }
}
