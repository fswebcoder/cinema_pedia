import 'package:cinema_pedia/presentation/screens/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/', // Ruta inicial
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      pageBuilder: (context, state) {
        return animationPage();
      },
    ),
  ],
);

CustomTransitionPage<dynamic> animationPage() {
  return CustomTransitionPage(
    child: const HomeScreen(),
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
