class CategoriesMoviesModel{
  List<MovieCategoryModel>? movies; // genres

  CategoriesMoviesModel({required this.movies});

  CategoriesMoviesModel.fromJson(Map<String,dynamic>json):this(
    movies: List<MovieCategoryModel>.from(json["genres"].map((e)=>MovieCategoryModel.fromJson(e)))
  );
}

class MovieCategoryModel{
  int? id;          // id
  String? category;

  MovieCategoryModel({required this.id, required this.category}); // name

  MovieCategoryModel.fromJson(Map<String,dynamic>json) :this(
    id : json["id"],
    category: json["name"],
  );
}