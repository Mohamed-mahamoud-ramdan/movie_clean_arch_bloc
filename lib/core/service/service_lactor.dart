import 'package:get_it/get_it.dart';
import 'package:movie/movies/data/data_source/movie_remote_data_souce.dart';
import 'package:movie/movies/data/repository/movies_repository.dart';
import 'package:movie/movies/domain/base_repository/base_movies_repo.dart';
import 'package:movie/movies/domain/use_cases/details_movie_use_case/detail_use_case.dart';
import 'package:movie/movies/domain/use_cases/get_now_playing_use_case.dart';
import 'package:movie/movies/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movie/movies/domain/use_cases/get_top_rate_movies_usecase.dart';
import 'package:movie/movies/domain/use_cases/recommendatio_use_cases/recommendatio_use_cases.dart';
import 'package:movie/movies/presentation/controller/bloc/movies_bloc.dart';
import 'package:movie/movies/presentation/controller/details_movie/bloc/details_movie_bloc.dart';

final GetIt sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerFactory(
      () {
        return MoviesBloc(sl(), sl(), sl());
      },
    );
    sl.registerFactory(
      () => DetailsMovieBloc(sl(), sl()),
    );
    // Register Use Cases
    sl.registerLazySingleton(() => GetNowPlayingUseCase(baseMoviesRepo: sl()));
    sl.registerLazySingleton(() => DetailUseCase(baseMoviesRepo: sl()));
    sl.registerLazySingleton(
        () => GetPopularMoviesUseCase(baseMoviesRepo: sl()));
    sl.registerLazySingleton(
        () => GetTopRateMoviesUsecase(baseMoviesRepo: sl()));
    sl.registerLazySingleton(() => RecommendatioUseCases(baseMoviesRepo: sl()));

    // Register Repositories
    sl.registerLazySingleton<BaseMoviesRepo>(
        () => MoviesRepository(baseRemoteDataSourcemovies: sl()));

    // Register Data Sources
    sl.registerLazySingleton<BaseRemoteDataSourceMovies>(
        () => MovieRemoteDataSource());
  }
}
