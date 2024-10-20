import 'package:movie/movies/domain/entities/movie.dart';

class MoviesModel extends Movie {
  const MoviesModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.overview,
      required super.voteAverage,
      required super.genreIds,
      required super.realseDate});

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      realseDate: json['releaseDate'],
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'] ?? '',
      overview: json['overview'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      genreIds: List<int>.from(json['genre_ids']),
    );
  }
}
