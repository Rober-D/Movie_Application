import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state management/popular_movies_provider.dart';
import '../state management/recommended_movies_provider.dart';
import 'home_screen/home_screen.dart';
import 'dart:async';

import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = "SplashScreen";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    var popularMovies = context.read<PopularMoviesProvider>();
    var recMovies = context.read<RecommendedMoviesProvider>();
    popularMovies.storePopularMovies();
    recMovies.storeRecommendedMovies();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, MainScreen.routeName);
    });
    setState(() {});
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Image.asset(
          "assets/images/splash.png",
        ),
      ),
    );
  }
}