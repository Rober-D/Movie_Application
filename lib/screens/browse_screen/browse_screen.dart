import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/colors.dart';
import '../../core/shared/bottom_navigation_bar.dart';
import '../../state management/movies_categories_provider.dart';

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
    return moviesCategories.categoriesMoviesModel == null
        ? const CircularProgressIndicator()
        : Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: const [
                    Text(
                      "Browse Category",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                      itemCount: moviesCategories
                          .categoriesMoviesModel!.movies!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 30.0,
                        mainAxisSpacing: 40.0,
                        mainAxisExtent: 115,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            ///ToDo - Category movies Page
                            print("${moviesCategories.categoriesMoviesModel!.movies![index].category}");
                          },
                          child: Material(
                            elevation: 20,
                            color: Colors.transparent,
                            child: Stack(
                              children: [
                                Center(
                                    child: Text(
                                      "${moviesCategories.categoriesMoviesModel!.movies![index].category}",
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),),
                                Image.asset(
                                  "assets/images/movies_bg.webp",
                                  opacity: const AlwaysStoppedAnimation(0.4),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          );
  }
}
