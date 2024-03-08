import 'dart:core';

class SimilarListModel{
  int? page;
  List<SimilarMovieModel>? similarMovieDetails;

  SimilarListModel({required this.page, required this.similarMovieDetails});

  SimilarListModel.fromJson(Map<String,dynamic>json):this(
    page: json["page"],
    similarMovieDetails: List<SimilarMovieModel>.from(
        json["results"].map((e) => SimilarMovieModel.fromJson(e))),
  );
}

class SimilarMovieModel {
  int? id;               //id
  String? image;         //backdrop_path
  String? title;         //original_title
  String? overview;      //overview
  String? poster;        //poster_path
  String? releaseDate;   //release_date
  double? voteAvg;       //vote_average

  SimilarMovieModel(
      {required this.id,
        required this.image,
        required this.title,
        required this.overview,
        required this.poster,
        required this.releaseDate,
        required this.voteAvg});

  SimilarMovieModel.fromJson(Map<String, dynamic> json)
      : this(
    id: json["id"],
    image: json["backdrop_path"],
    title: json["original_title"],
    overview: json["overview"],
    poster: json["poster_path"],
    releaseDate: json["release_date"],
    voteAvg: json["vote_average"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "backdrop_path": image,
    "original_title": title,
    "overview": overview,
    "poster_path": poster,
    "release_date": releaseDate,
    "vote_average": voteAvg
  };
}
