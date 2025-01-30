import 'package:cinema_pedia/presentation/screens/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/', // Ruta inicial
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      pageBuilder: (context, state) {
        return animationPage(const HomeScreen());
      },
    ),
    GoRoute(
      path: '/movie/:id',
      name: MovieScreen.name,
      pageBuilder: (context, state) {
        final id = state.pathParameters['id'] ?? 'No-id';
        return animationPage(MovieScreen(movieId: id));
      },
    ),
  ],
);

CustomTransitionPage<dynamic> animationPage(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0), // Animación de derecha a izquierda
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}
