import 'package:flutter/material.dart';
import 'package:movie_application/core/constants/colors.dart';
import 'package:movie_application/screens/home_screen/home_widgets/poster_movie_card.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/links.dart';
import '../../../state management/popular_movies_provider.dart';
import 'image_movie_card.dart';

class MovieView extends StatefulWidget {
  MovieView({super.key,required this.title, required this.date,required this.imagePath, required this.posterPath, this.index});
  String? title;
  String? date;
  String? imagePath;
  String? posterPath;
  int? index;

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  @override
  Widget build(BuildContext context) {

    PopularMoviesProvider popularMoviesProvider =
        Provider.of<PopularMoviesProvider>(context);

    return Container(
      color: AppColors.baseColor,
      child: popularMoviesProvider.popularMovies == null
            ? const CircularProgressIndicator()
            : Stack(
                children: [
                  ImageCard(
                    title: widget.title,
                    imagePath:
                        "${Links.IMAGE_URL}${widget.imagePath}",
                    releaseDate: widget.date,
                  ),
                  Positioned(
                    height: 150,
                    top: 120,
                    left: 15,
                    child: PosterCard(
                      index: widget.index,
                      poster:
                          "${Links.IMAGE_URL}${widget.posterPath}",
                    ),
                  ),
                ],
              )
    );
  }
}
