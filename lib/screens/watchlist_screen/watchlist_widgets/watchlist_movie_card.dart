import 'package:flutter/material.dart';
import 'package:movie_application/core/constants/colors.dart';
import 'package:movie_application/state%20management/user_movies_provider.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/links.dart';
import '../../../models/movies_model.dart';

class WatchlistMovieCard extends StatefulWidget {
  WatchlistMovieCard({super.key, required this.movie, required this.showFav});

  MovieModel? movie;
  bool? showFav;

  @override
  State<WatchlistMovieCard> createState() => _WatchlistMovieCardState();
}

class _WatchlistMovieCardState extends State<WatchlistMovieCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserMoviesProvider userFavMovies = Provider.of<UserMoviesProvider>(context);

    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              //Image
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: widget.movie!.image == null
                      ? Container()
                      : Image.network(Links.IMAGE_URL + widget.movie!.image!)),
              widget.showFav == true
                  ? InkWell(
                      onTap: () {
                        ///ToDo remove from fav
                        setState(() {
                          userFavMovies.removeFromFavourite(widget.movie!);
                          widget.movie!.isFav = false;
                        });
                      },
                      child: Image(
                        image: widget.movie!.isFav == false
                            ? const AssetImage("assets/icons/bookmark.png")
                            : const AssetImage(
                                "assets/icons/bookmark_selected.png"),
                        width: 25,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            children: [
              //Details
              Row(
                children: [
                  Expanded(
                    child: Text(
                      partOfDesc(widget.movie!.title!),
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    widget.movie!.releaseDate!,
                    style: const TextStyle(
                      color: AppColors.moviesDetailsTextColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      partOfDesc(widget.movie!.overview!),
                      style: const TextStyle(
                        color: AppColors.moviesDetailsTextColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
  String partOfDesc(String desc) {
    List<String> words = desc.split(' ');
    return '${words.take(4).join(' ')} ...';
  }
}
