import 'package:flutter/material.dart';
import 'package:movie_application/core/constants/colors.dart';
import 'package:movie_application/core/constants/links.dart';
import 'package:movie_application/screens/watchlist_screen/watchlist_widgets/watchlist_movie_card.dart';
import 'package:provider/provider.dart';

import '../../state management/user_movies_provider.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  static const String routeName = "WatchlistScreen";

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  @override
  Widget build(BuildContext context) {
    UserMoviesProvider userFavMovies =
        Provider.of<UserMoviesProvider>(context);

    return (userFavMovies.userMovies.isEmpty && userFavMovies.userMovies.isEmpty)
        ? const Center(
            child: Image(
              image: AssetImage("assets/icons/no_moves_found.png"),
              width: 100,
            ),
          )
        : Column(
          children: [
            const SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: const[
                  Text('Watchlist',style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return WatchlistMovieCard(
                        movie: userFavMovies.userMovies[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 30,
                        thickness: 0.7,
                        color: AppColors.moviesDescTextColor,
                        indent: 20,
                        endIndent: 20,
                      );
                    },
                    itemCount: userFavMovies.userMovies.length,
                  ),
              ),
            ),
          ],
        );
  }
}
