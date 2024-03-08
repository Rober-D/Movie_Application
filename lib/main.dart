import 'package:flutter/material.dart';
import 'package:movie_application/models/popular_model.dart';
import 'package:movie_application/state%20management/popular_movies_provider.dart';
import 'package:movie_application/state%20management/recommended_movies_provider.dart';
import 'package:movie_application/state%20management/screens_provider.dart';
import 'package:movie_application/state%20management/similar_movies_provider.dart';
import 'package:provider/provider.dart';
import 'core/routes/routes.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ScreensProvider>(create: (_) => ScreensProvider()),
        ChangeNotifierProvider<PopularMoviesProvider>(create: (_) => PopularMoviesProvider()),
        ChangeNotifierProvider<RecommendedMoviesProvider>(create: (_) => RecommendedMoviesProvider()),
        ChangeNotifierProvider<SimilarMoviesProvider>(create: (_) => SimilarMoviesProvider()),
      ],
      child: const Movie(),
    ),
  );
}

class Movie extends StatelessWidget {
  const Movie({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
      home: SplashScreen(),
    );
  }
}