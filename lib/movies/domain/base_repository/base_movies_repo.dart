import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';

import 'package:movie/movies/domain/entities/movie.dart';
import 'package:movie/movies/domain/entities/movie_details.dart';
import 'package:movie/movies/domain/entities/recommendation.dart';

abstract class BaseMoviesRepo {
  Future<Either<Failure, List<Movie>>> getNowPlaying();
  Future<Either<Failure, List<Movie>>> gtePopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMoveis();
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      {required int id});

  ///////////////////
  Future<Either<Failure, MovieDetails>> getDetailsMovei({required int id});
}
