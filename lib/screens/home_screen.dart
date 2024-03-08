import 'package:flutter/material.dart';
import 'package:movie_application/screens/temp_screen.dart';
import 'package:movie_application/state%20management/popular_movies_provider.dart';
import 'package:movie_application/state%20management/similar_movies_provider.dart';
import 'package:provider/provider.dart';
import '../core/constants/links.dart';
import '../state management/recommended_movies_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    var recommendedMovies = context.read<RecommendedMoviesProvider>();
    var popularMovies = context.read<PopularMoviesProvider>();
    recommendedMovies.storeRecommendedMovies();
    popularMovies.storePopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    PopularMoviesProvider popularMoviesProvider =
        Provider.of<PopularMoviesProvider>(context);
    RecommendedMoviesProvider recommendedMoviesProvider =
        Provider.of<RecommendedMoviesProvider>(context);
    SimilarMoviesProvider similarMoviesProvider =
        Provider.of<SimilarMoviesProvider>(context);

    return popularMoviesProvider.popularMovies == null
        ? const CircularProgressIndicator()
        : Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: popularMoviesProvider.popularMovies!.popularMovieDetails!.isEmpty ? 0 : popularMoviesProvider.popularMovies!.popularMovieDetails!.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      popularMoviesProvider.getSpecificMovie(
                          popularMoviesProvider
                              .popularMovies!.popularMovieDetails![index].id!);
                      print(
                          "Movie Chosen ID : ${popularMoviesProvider.specificMovie![0].id}");
                      print(
                          "Movie Chosen Name : ${popularMoviesProvider.specificMovie![0].title}");
                      similarMoviesProvider.storeSimilarMovies(popularMoviesProvider.specificMovie![0].id!);
                      Navigator.pushNamed(context, TempScreen.routeName);
                    },
                    child: Column(
                      children: [
                        Text(
                          popularMoviesProvider
                              .popularMovies!.popularMovieDetails![index].id
                              .toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          popularMoviesProvider
                              .popularMovies!.popularMovieDetails![index].title
                              .toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          popularMoviesProvider.popularMovies!
                              .popularMovieDetails![index].overview
                              .toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          popularMoviesProvider.popularMovies!
                              .popularMovieDetails![index].voteAvg
                              .toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          popularMoviesProvider.popularMovies!
                              .popularMovieDetails![index].releaseDate
                              .toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        Image.network(Links.IMAGE_URL +
                            popularMoviesProvider.popularMovies!
                                .popularMovieDetails![index].image!),
                      ],
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 50,
                      thickness: 1.5,
                      color: Colors.white,
                    );
                  },
                ),
              ),
            ],
          );
  }
}
