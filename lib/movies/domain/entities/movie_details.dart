import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final String backDropPath;
  final int id;
  final String overview;
  final String releaseDate; // Corrected typo from realseDate
  final String title;
  final int runtime;
  final double voteAverage; // Changed to double for consistency
  final List<Genre> genres; // Corrected types

  const MovieDetails({
    required this.genres,
    required this.backDropPath,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.runtime,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        backDropPath,
        id,
        overview,
        releaseDate,
        title,
        runtime,
        voteAverage,
        genres,
      ];
}

class Genre extends Equatable {
  // Renamed from Genreis to Genre
  final int id;
  final String name;

  const Genre({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
