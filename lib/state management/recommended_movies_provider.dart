import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../api manager/api_manager.dart';
import '../models/recommended_model.dart';

class RecommendedMoviesProvider extends ChangeNotifier{
  RecommendedListModel? recommendedMovies;

  void storeRecommendedMovies()async{
    try{
      Response response = await ApiManager.getRecommendedMovies();
      if(response.statusCode == 200){
        recommendedMovies = RecommendedListModel.fromJson(response.data);
        notifyListeners();
      }
    }catch(e){
      print(e);
    }
  }
}