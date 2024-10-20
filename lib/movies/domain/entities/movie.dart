// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int? id;
  final String? title;
  final String? backdropPath;
  final String? overview;
  final double? voteAverage;
  final List<int>? genreIds;
  final String? realseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.voteAverage,
    required this.genreIds,
    required this.realseDate,
  });

  @override
  List<Object?> get props =>
      [id, title, backdropPath, overview, voteAverage, genreIds, realseDate];
}
