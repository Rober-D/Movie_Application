import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../api manager/api_manager.dart';
import '../models/movies_model.dart';

class PopularMoviesProvider extends ChangeNotifier {
  MovieListModel? popularMovies;
  List<MovieModel>? specificMovie;

  void storePopularMovies() async {
    try {
      Response response = await ApiManager.getPopularMovies();
      if (response.statusCode == 200) {
        popularMovies = MovieListModel.fromJson(response.data);
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  MovieModel? getSpecificMovie(int idOfMovie) {
    specificMovie = popularMovies!.movieDetails!
        .where((element) => element.id == idOfMovie).toList();
    return specificMovie![0];
  }
}
