import 'package:dio/dio.dart';

class ApiManager{
  static const String apiKey = "0854b3e0970a85410126be000b5b7cf1";
  static const String apiAccessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwODU0YjNlMDk3MGE4NTQxMDEyNmJlMDAwYjViN2NmMSIsInN1YiI6IjY0YzUxZDQyZWVjNWI1MDEzOWZmNjU1MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.1D4Qfqwpp7lv6vKgcBxFDbWGJQNFcSRyTiPuceKv_Is";
  static const String popularUrl = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1&api_key=${apiKey}";
  static const String recommendedUrl = "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1&api_key=${apiKey}";


  static Future<Response> getPopularMovies()async {
    Response response = await Dio().get(popularUrl);
    if (response.statusCode == 200) {
      print("The Response has been done successfully");
      return response;
    }
    return response;
  }

  static Future<Response> getRecommendedMovies() async{
    Response response = await Dio().get(recommendedUrl);
    if (response.statusCode == 200) {
      print("The Response has been done successfully");
      return response;
    }
    return response;
  }

  static Future<Response> getSimilarMovies(int idOfMovie) async{
    String similarUrl = "https://api.themoviedb.org/3/movie/${idOfMovie}/similar?language=en-US&page=1&api_key=${apiKey}";
    Response response = await Dio().get(similarUrl);
    if (response.statusCode == 200) {
      print("The Response of Similarity has been done successfully");
      return response;
    }
    return response;
  }
}
