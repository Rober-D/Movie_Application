import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/models/popular_model.dart';
import '../api manager/api_manager.dart';

class PopularMoviesProvider extends ChangeNotifier {
  PopularListModel? popularMovies;
  List<PopularMovieModel>? specificMovie;

  void storePopularMovies() async {
    try {
      Response response = await ApiManager.getPopularMovies();
      if (response.statusCode == 200) {
        popularMovies = PopularListModel.fromJson(response.data);
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  PopularMovieModel? getSpecificMovie(int idOfMovie) {
    specificMovie = popularMovies!.popularMovieDetails!
        .where((element) => element.id == idOfMovie).toList();
    return specificMovie![0];
  }
}
