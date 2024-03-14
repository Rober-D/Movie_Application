import 'package:flutter/material.dart';
import 'package:movie_application/core/constants/colors.dart';
import 'package:movie_application/main.dart';
import 'package:movie_application/screens/home_screen/home_widgets/movie_view.dart';
import 'package:movie_application/screens/home_screen/home_widgets/poster_movie_card.dart';
import 'package:movie_application/state%20management/popular_movies_provider.dart';
import 'package:movie_application/state%20management/recommended_movies_provider.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../core/constants/links.dart';
import 'home_screen/home_widgets/recommended_movie_card.dart';

class TempScreen extends StatefulWidget {
  const TempScreen({super.key});

  static const String routeName = "tempScreen";

  @override
  State<TempScreen> createState() => _TempScreenState();
}

class _TempScreenState extends State<TempScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var recMovies = context.read<RecommendedMoviesProvider>();
    recMovies.storeRecommendedMovies();
  }

  @override
  Widget build(BuildContext context) {
    RecommendedMoviesProvider recMovies =
        Provider.of<RecommendedMoviesProvider>(context);

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.baseColor,
      body: Center(
        child: SizedBox(
          height: screenHeight * 0.35,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: screenWidth * 0.37,
                color: AppColors.moviesBGColor,
                padding: const EdgeInsets.only(left: 15, right: 15,top: 15),
                child: Center(
                  child: RecommendedCard(
                    index: index,
                    movie: recMovies.recommendedMovies!.movieDetails![index],
                  ),
                ),
              );
            },
            itemCount:
                recMovies.recommendedMovies!.movieDetails!.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
