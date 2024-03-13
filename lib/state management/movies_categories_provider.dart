import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/api%20manager/api_manager.dart';
import 'package:movie_application/models/categories_movies_model.dart';

class MoviesCategoriesProvider extends ChangeNotifier{
  CategoriesMoviesModel? categoriesMoviesModel;

  void storeMoviesCategories()async{
    Response response = await ApiManager.getMoviesCategories();
    try{
      if(response.statusCode == 200){
        categoriesMoviesModel = CategoriesMoviesModel.fromJson(response.data);
        notifyListeners();
      }
    }catch(e){
      print(e);
    }
  }
}