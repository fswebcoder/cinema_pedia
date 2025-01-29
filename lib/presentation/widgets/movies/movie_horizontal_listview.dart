import 'package:flutter/material.dart';

import '../../../domain/entities/index.dart';

class MovieHorizontalListview extends StatelessWidget {
  final List<Movie> movies;
  final String? tittle;
  final String? sunTitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview(
      {super.key,
      required this.movies,
      this.tittle,
      this.sunTitle,
      this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 260,
        child: Column(
          children: [
            if (tittle != null || sunTitle != null) _Tittle(tittle, sunTitle),
          ],
        ));
  }
}

class _Tittle extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Tittle(this.title, this.subTitle);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null)
            Text(
              title!,
              style: titleStyle,
            ),
          const Spacer(),
          if (subTitle != null)
            FilledButton.tonal(
              onPressed: () {},
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              child: Text(subTitle!),
            )
        ],
      ),
    );
  }
}
