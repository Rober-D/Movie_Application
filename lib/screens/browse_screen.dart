import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/constants/colors.dart';
import '../core/shared/bottom_navigation_bar.dart';
import '../state management/movies_categories_provider.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});
  static const String routeName = "BrowseScreen";
  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var moviesCategories = context.read<MoviesCategoriesProvider>();
    moviesCategories.storeMoviesCategories();
  }
  @override
  Widget build(BuildContext context) {
    MoviesCategoriesProvider moviesCategories =
    Provider.of<MoviesCategoriesProvider>(context);
    return  moviesCategories.categoriesMoviesModel == null
        ? const CircularProgressIndicator()
        : ListView.separated(
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(moviesCategories
                  .categoriesMoviesModel!.movies![index].id
                  .toString(),style: const TextStyle(color: Colors.white70),),
              Text(moviesCategories
                  .categoriesMoviesModel!.movies![index].category
                  .toString(),style: const TextStyle(color: Colors.white70),)
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            thickness: 2,
            height: 10,
            color: Colors.white70,
            indent: 20,
            endIndent: 20,
          );
        },
        itemCount:
        moviesCategories.categoriesMoviesModel!.movies!.length);
  }
}
