import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../api manager/api_manager.dart';
import '../models/similar_model.dart';

class SimilarMoviesProvider extends ChangeNotifier{

  SimilarListModel? similarMovies;

  void storeSimilarMovies(int idOfMovie) async {
    try {
      Response response = await ApiManager.getSimilarMovies(idOfMovie);
      if (response.statusCode == 200) {
        similarMovies = SimilarListModel.fromJson(response.data);
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}