import 'package:movie/core/error/excption.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/movies/data/data_source/movie_remote_data_souce.dart';
import 'package:movie/movies/domain/base_repository/base_movies_repo.dart';
import 'package:movie/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:movie/movies/domain/entities/movie_details.dart';
import 'package:movie/movies/domain/entities/recommendation.dart';

class MoviesRepository extends BaseMoviesRepo {
  final BaseRemoteDataSourceMovies baseRemoteDataSourcemovies;

  MoviesRepository({required this.baseRemoteDataSourcemovies});
  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    try {
      final result = await baseRemoteDataSourcemovies.getNowPlayingMovies();

      return right(result);
    } on ServerException catch (e) {
      return left(
          ServerFailure(message: e.errorMessageModelmovie.statusmessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMoveis() async {
    final result = await baseRemoteDataSourcemovies.getPopularMovies();

    try {
      return right(result);
    } on ServerException catch (e) {
      return left(
          ServerFailure(message: e.errorMessageModelmovie.statusmessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> gtePopularMovies() async {
    final result = await baseRemoteDataSourcemovies.getTopRatedPopularMovies();

    try {
      return right(result);
    } on ServerException catch (e) {
      return left(
          ServerFailure(message: e.errorMessageModelmovie.statusmessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getDetailsMovei(
      {required int id}) async {
    final result =
        await baseRemoteDataSourcemovies.getDetailsMovie(idMovie: id);

    try {
      return right(result);
    } on ServerException catch (e) {
      return left(
          ServerFailure(message: e.errorMessageModelmovie.statusmessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      {required int id}) async {
    try {
      final reuslt = await baseRemoteDataSourcemovies
          .getRecommendationMovieUsingId(id: id);
      return right(reuslt);
    } on ServerException catch (e) {
      return left(
          ServerFailure(message: e.errorMessageModelmovie.statusmessage));
    }
  }
}
