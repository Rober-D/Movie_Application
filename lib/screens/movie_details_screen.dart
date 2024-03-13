import 'package:flutter/material.dart';
import 'package:movie_application/core/constants/colors.dart';
import 'package:movie_application/core/constants/links.dart';
import 'package:movie_application/screens/home_screen/home_widgets/poster_movie_card.dart';
import 'package:movie_application/screens/watchlist_screen/watchlist_widgets/watchlist_movie_card.dart';
import 'package:movie_application/state%20management/similar_movies_provider.dart';
import 'package:provider/provider.dart';

import '../state management/user_movies_provider.dart';
import 'home_screen/home_widgets/recommended_movie_card.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  static const String routeName = "MovieDetailsScreen";

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    UserMoviesProvider userMovies = Provider.of<UserMoviesProvider>(context);
    SimilarMoviesProvider similarMovies = Provider.of<SimilarMoviesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.baseColor,
        leading: const BackButton(),
        title: Text(
          userMovies.movieStored!.title!,
          style: const TextStyle(
              color: AppColors.moviesDescTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: AppColors.baseColor,
      body: ListView(
        children: [
          Image.network(Links.IMAGE_URL + userMovies.movieStored!.image!),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: Text(
              userMovies.movieStored!.title!,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.moviesDescTextColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10),
            child: Text(
              userMovies.movieStored!.releaseDate!,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.moviesDetailsTextColor),
            ),
          ),
          const SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10),
            child: WatchlistMovieCard(
              movie: userMovies.movieStored,
              showFav: true,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Padding(
                padding:
                EdgeInsets.only(left: 15, right: 15, top: 8),
                child: Text(
                  "Recommended",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: screenHeight * 0.37,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: screenWidth * 0.37,
                  padding:
                  const EdgeInsets.only(left: 15, right: 15),
                  child: InkWell(
                    onTap: (){
                      setState(() {

                      });
                    },
                    child: Center(
                      child: RecommendedCard(
                          index: index,
                          movie: similarMovies.similarMovies!.movieDetails![index]),
                    ),
                  ),
                );
              },
              itemCount: similarMovies
                  .similarMovies!.movieDetails!.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
