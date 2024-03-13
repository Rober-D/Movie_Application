import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../api manager/api_manager.dart';
import '../models/movies_model.dart';

class RecommendedMoviesProvider extends ChangeNotifier{
  MovieListModel? recommendedMovies;

  void storeRecommendedMovies()async{
    try{
      Response response = await ApiManager.getRecommendedMovies();
      if(response.statusCode == 200){
        recommendedMovies = MovieListModel.fromJson(response.data);
        notifyListeners();
      }
    }catch(e){
      print(e);
    }
  }
}