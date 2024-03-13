import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/links.dart';
import '../../state management/search_movies_provider.dart';
import '../watchlist_screen/watchlist_widgets/search_text_form_field.dart';
import '../watchlist_screen/watchlist_widgets/watchlist_movie_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const String routeName = "SearchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    SearchForMoviesProvider searchForMoviesProvider =
        Provider.of<SearchForMoviesProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.baseColor,
      body: (searchForMoviesProvider.searchListModel == null ||
              searchForMoviesProvider.searchListModel!.movieDetails!.isEmpty)
          ? Column(
              children: const [
                SizedBox(height: 20,),
                SearchTextFormField(),
                Center(
                  child: Image(
                    image: AssetImage("assets/icons/no_moves_found.png"),
                    width: 150,
                  ),
                ),
              ],
            )
          : Column(children: [
            const SizedBox(height: 20,),
              const SearchTextFormField(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return WatchlistMovieCard(
                        showFav: false,
                        movie: searchForMoviesProvider
                            .searchListModel!.movieDetails![index],
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
                    itemCount: searchForMoviesProvider
                        .searchListModel!.movieDetails!.length,
                  ),
                ),
              )
            ]),
    );
  }
}
