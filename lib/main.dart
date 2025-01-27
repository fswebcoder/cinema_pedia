import 'package:cinema_pedia/config/router/app_router.dart';
import 'package:flutter/material.dart';

import 'config/index.dart';

void main() {
  runApp(const CinemaApp());
}

class CinemaApp extends StatelessWidget {
  const CinemaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Cinema App',
      theme: AppTheme().getTheme(),
    );
  }
}
