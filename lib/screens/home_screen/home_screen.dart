import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/screens/home_screen/home_widgets/recommended_movie_card.dart';
import 'package:movie_application/state%20management/popular_movies_provider.dart';
import 'package:movie_application/state%20management/recommended_movies_provider.dart';
import 'package:provider/provider.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/links.dart';
import '../../models/movies_model.dart';
import 'home_widgets/movie_view.dart';
import 'home_widgets/poster_movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    PopularMoviesProvider popularMoviesProvider =
        Provider.of<PopularMoviesProvider>(context);
    RecommendedMoviesProvider recommendedMoviesProvider =
        Provider.of<RecommendedMoviesProvider>(context);

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.baseColor,
      body: (popularMoviesProvider.popularMovies == null ||
              recommendedMoviesProvider.recommendedMovies == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                CarouselSlider(
                  items:
                      showPopularMovies(popularMoviesProvider.popularMovies!),
                  options: CarouselOptions(
                    height: 300,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Container(
                  color: AppColors.moviesBGColor,
                  height: screenHeight * 0.28,
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 8),
                            child: Text(
                              "New Releases",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: screenWidth * 0.37,
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Center(
                                child: PosterCard(
                                    index: index,
                                    poster:
                                        "${Links.IMAGE_URL}${popularMoviesProvider.popularMovies!.movieDetails![index].poster}"),
                              ),
                            );
                          },
                          itemCount: popularMoviesProvider
                              .popularMovies!.movieDetails!.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  color: AppColors.moviesBGColor,
                  height: screenHeight * 0.39,
                  child: Column(
                    children: [
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
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: screenWidth * 0.37,
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Center(
                                child: RecommendedCard(
                                  index: index,
                                  movie: recommendedMoviesProvider.recommendedMovies!.movieDetails![index]),
                                ),
                            );
                          },
                          itemCount: recommendedMoviesProvider
                              .recommendedMovies!.movieDetails!.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
    );
  }

  List<Widget> showPopularMovies(MovieListModel popularListModel) {
    List<Widget> posters = [];
    for (int i = 0; i < popularListModel.movieDetails!.length; ++i) {
      setState(() {
        posters.add(MovieView(
            title: popularListModel.movieDetails![i].title,
            date: popularListModel.movieDetails![i].releaseDate,
            imagePath: popularListModel.movieDetails![i].image,
            posterPath: popularListModel.movieDetails![i].poster,
            index: i));
      });
    }
    return posters;
  }
}
