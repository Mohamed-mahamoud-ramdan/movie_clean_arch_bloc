import 'package:dio/dio.dart';
import 'package:movie/core/error/excption.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/network/error_message_models/error_message_model_movie.dart';
import 'package:movie/movies/data/model/detials_movei.dart';
import 'package:movie/movies/data/model/movies_model.dart';
import 'package:movie/movies/data/model/recommendation_model.dart';

abstract class BaseRemoteDataSourceMovies {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedPopularMovies();
  Future<List<RecommendationModel>> getRecommendationMovieUsingId(
      {required int id});
  Future<DetailsMovieModel> getDetailsMovie({required int idMovie});
}

class MovieRemoteDataSource extends BaseRemoteDataSourceMovies {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
      options: Options(receiveTimeout: const Duration(seconds: 200)),
      "${ApiConstants.getNowPlayingpath}",
    );

    if (response.statusCode == 200) {
      List data = response.data["results"];

      List<MoviesModel> moviesdata = [];
      for (var i in data) {
        moviesdata.add(MoviesModel.fromJson(i));
      }

      return moviesdata;
      // return List<MoviesModel>.from((response.data["results"] as List).map(
      //   (e) => MoviesModel.fromJson(e),
      // ));
    } else {
      throw ServerException(
        errorMessageModelmovie: ErrorMessageModelmovie.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(
      ApiConstants.getPopularMoviespath,
    );

    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List).map(
        (e) => MoviesModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModelmovie: ErrorMessageModelmovie.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedPopularMovies() async {
    final response = await Dio().get(
      options: Options(receiveTimeout: const Duration(seconds: 200)),
      ApiConstants.getTopRatedPath,
    );

    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List).map(
        (e) => MoviesModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModelmovie: ErrorMessageModelmovie.fromJson(response.data),
      );
    }
  }

  @override
  Future<DetailsMovieModel> getDetailsMovie({required int idMovie}) async {
    final response = await Dio().get(
      ApiConstants.getMovieDetailsUrlpath(id: idMovie),
    );

    if (response.statusCode == 200) {
      return DetailsMovieModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModelmovie: ErrorMessageModelmovie.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendationMovieUsingId(
      {required int id}) async {
    final response = await Dio().get(
      options: Options(receiveTimeout: const Duration(seconds: 200)),
      ApiConstants.getRecomndationPath(id: id),
    );

    if (response.statusCode == 200) {
      List<RecommendationModel> recommmendationList = [];

      for (var i in response.data["results"] as List) {
        recommmendationList.add(RecommendationModel.formjson(json: i));
      }
      return recommmendationList;
    } else {
      throw ServerException(
        errorMessageModelmovie: ErrorMessageModelmovie.fromJson(response.data),
      );
    }
  }
}
