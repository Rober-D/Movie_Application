import 'package:flutter/material.dart';
import '../models/movies_model.dart';

class UserMoviesProvider extends ChangeNotifier{
  List<MovieModel> userMovies = [];

  void addToFavourite(MovieModel movie){
    if(movie.isFav == false){
      userMovies.add(movie);
      print(userMovies[0].title);
      notifyListeners();
    }else{
      print("The Movie is already in favourite");
      removeFromFavourite(movie);
    }
  }

  void removeFromFavourite(MovieModel movie){
   userMovies.remove(movie);
   notifyListeners();
  }
}