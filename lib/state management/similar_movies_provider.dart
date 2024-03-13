import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../api manager/api_manager.dart';
import '../models/movies_model.dart';

class SimilarMoviesProvider extends ChangeNotifier{

  MovieListModel? similarMovies;

  void storeSimilarMovies(int idOfMovie) async {
    try {
      Response response = await ApiManager.getSimilarMovies(idOfMovie);
      if (response.statusCode == 200) {
        similarMovies = MovieListModel.fromJson(response.data);
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}