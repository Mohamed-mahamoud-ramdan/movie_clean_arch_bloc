import 'package:movie/movies/domain/entities/movie_details.dart';

class DetailsMovieModel extends MovieDetails {
  // Corrected class name and properties
  DetailsMovieModel({
    required super.genres,
    required super.backDropPath,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.title,
    required super.runtime,
    required super.voteAverage,
  });

  factory DetailsMovieModel.fromJson(Map<String, dynamic> json) {
    return DetailsMovieModel(
      genres:
          List<Genre>.from(json['genres'].map((x) => GenreModel.fromJson(x))),
      backDropPath: json['backdrop_path'],
      id: json['id'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      title: json['title'],
      runtime: json['runtime'],
      voteAverage: (json['vote_average'] as num).toDouble(),
    );
  }
}

class GenreModel extends Genre {
  // Updated GenreModel class to match the structure of Genre
  GenreModel({required super.id, required super.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
