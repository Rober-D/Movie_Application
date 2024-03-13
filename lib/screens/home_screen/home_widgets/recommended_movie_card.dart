import 'package:flutter/material.dart';
import 'package:movie_application/core/constants/links.dart';
import 'package:movie_application/state%20management/recommended_movies_provider.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/colors.dart';
import '../../../models/movies_model.dart';
import '../../../state management/user_movies_provider.dart';

class RecommendedCard extends StatefulWidget {
  RecommendedCard({super.key, required this.movie, required this.index});

  MovieModel? movie;
  int? index;

  @override
  State<RecommendedCard> createState() => _RecommendedCardState();
}

class _RecommendedCardState extends State<RecommendedCard> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    UserMoviesProvider userFavMovies = Provider.of<UserMoviesProvider>(context);
    RecommendedMoviesProvider recommendedMoviesProvider =
        Provider.of<RecommendedMoviesProvider>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Image.network(
                Links.IMAGE_URL+widget.movie!.poster!,
                fit: BoxFit.cover,
              ),
              InkWell(
                onTap: () {
                  ///To Do : Add to fav.
                  setState(() {
                    userFavMovies.addToFavourite(widget.movie!);

                    recommendedMoviesProvider.recommendedMovies!
                        .movieDetails![widget.index!].isFav =
                    !recommendedMoviesProvider.recommendedMovies!
                        .movieDetails![widget.index!].isFav!;
                  });
                },
                child: Image(
                  image: widget.movie!.isFav == false
                      ? const AssetImage("assets/icons/bookmark.png")
                      : const AssetImage("assets/icons/bookmark_selected.png"),
                  width: screenHeight * 0.035,
                ),
              )
            ],
          ),
          Container(
            color: AppColors.recDetailsColor,
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.002,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.movie!.voteAvg.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.movie!.title.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.movie!.releaseDate.toString(),
                        style: const TextStyle(
                            color: AppColors.moviesDetailsTextColor),
                      ),
                      SizedBox(
                        height: screenHeight * 0.035,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
