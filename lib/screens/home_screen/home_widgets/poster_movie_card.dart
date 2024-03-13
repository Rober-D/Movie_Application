import 'package:flutter/material.dart';
import 'package:movie_application/state%20management/user_movies_provider.dart';
import 'package:provider/provider.dart';
import '../../../state management/popular_movies_provider.dart';

class PosterCard extends StatefulWidget {
  PosterCard({super.key, required this.poster, this.index});

  String? poster;
  int? index;

  @override
  State<PosterCard> createState() => _PosterCardState();
}

class _PosterCardState extends State<PosterCard> {
  @override
  Widget build(BuildContext context) {
    PopularMoviesProvider popularMoviesProvider =
        Provider.of<PopularMoviesProvider>(context);
    UserMoviesProvider userMovies =
        Provider.of<UserMoviesProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.topLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            widget.poster!,
            fit: BoxFit.cover,
          ),
        ),
        InkWell(
            onTap: () {
              ///ToDo : Add to fav.
             setState(() {
               userMovies.addToFavourite(popularMoviesProvider.popularMovies!
                   .movieDetails![widget.index!]);

               popularMoviesProvider.popularMovies!
                   .movieDetails![widget.index!].isFav =
               !popularMoviesProvider
                   .popularMovies!.movieDetails![widget.index!].isFav;
             });
            },
            child: Image(
              image: popularMoviesProvider.popularMovies!
                          .movieDetails![widget.index!].isFav ==
                      false
                  ? const AssetImage("assets/icons/bookmark.png")
                  : const AssetImage("assets/icons/bookmark_selected.png"),
              width: screenHeight * 0.035,
            ))
      ],
    );
  }
}
