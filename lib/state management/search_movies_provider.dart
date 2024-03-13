import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/api%20manager/api_manager.dart';
import 'package:movie_application/models/search_model.dart';

class SearchForMoviesProvider extends ChangeNotifier{

  SearchListModel? searchListModel;

  void storeSearchForMovies(String query) async{
    try{
      Response response = await ApiManager.searchForMovie(query);
      if(response.statusCode == 200){
        searchListModel = SearchListModel.fromJson(response.data);
        notifyListeners();
      }
    }catch(e){
      print(e);
    }
  }

}