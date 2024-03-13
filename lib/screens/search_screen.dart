import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/constants/links.dart';
import '../state management/search_movies_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const String routeName = "SearchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchQuery = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SearchForMoviesProvider searchForMoviesProvider =
        Provider.of<SearchForMoviesProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white70,
      body: (searchForMoviesProvider.searchListModel == null ||
              searchForMoviesProvider
                  .searchListModel!.searchMovieDetails!.isEmpty)
          ? Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(40),
                  child: TextFormField(
                    controller: searchQuery,
                    decoration: const InputDecoration(hintText: "Search for"),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        print("Search for : $searchQuery");
                        searchForMoviesProvider
                            .storeSearchForMovies(searchQuery!.text);
                      });
                    },
                    child: const Text("Search")),
                const Center(
                  child: Text(
                    "There Is No Data To Search for.",
                    style: TextStyle(fontSize: 50, color: Colors.indigo),
                  ),
                ),
              ],
            )
          : Column(children: [
              Container(
                padding: const EdgeInsets.all(40),
                child: TextFormField(
                  controller: searchQuery,
                  decoration: const InputDecoration(hintText: "Search for"),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      print("Search for : ${searchQuery}");
                      searchForMoviesProvider
                          .storeSearchForMovies(searchQuery!.text);
                    });
                  },
                  child: const Text("Search")),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                searchForMoviesProvider.searchListModel!
                                            .searchMovieDetails![index].image ==
                                        null
                                    ? Container(
                                        color: Colors.amber,
                                        width: 50,
                                        height: 20,
                                      )
                                    : Image.network(
                                        Links.IMAGE_URL +
                                            searchForMoviesProvider
                                                .searchListModel!
                                                .searchMovieDetails![index]
                                                .image!,
                                        height: 30,
                                        width: 20),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(searchForMoviesProvider.searchListModel!
                                    .searchMovieDetails![index].title!),
                                Text(searchForMoviesProvider.searchListModel!
                                    .searchMovieDetails![index].voteAvg
                                    .toString()!),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(searchForMoviesProvider.searchListModel!
                                .searchMovieDetails![index].overview!),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        thickness: 2,
                        height: 15,
                        color: Colors.black,
                      );
                    },
                    itemCount: searchForMoviesProvider
                            .searchListModel!.searchMovieDetails!.isEmpty
                        ? 0
                        : searchForMoviesProvider
                            .searchListModel!.searchMovieDetails!.length),
              )
            ]),
    );
  }
}
