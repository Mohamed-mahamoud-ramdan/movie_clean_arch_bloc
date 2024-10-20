import 'package:bloc/bloc.dart';
import 'package:movie/movies/domain/use_cases/get_now_playing_use_case.dart';
import 'package:movie/movies/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movie/movies/domain/use_cases/get_top_rate_movies_usecase.dart';
import 'package:movie/movies/presentation/controller/bloc/movies_event.dart';
import 'package:movie/movies/presentation/controller/bloc/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRateMoviesUsecase getTopRateMoviesUsecase;

  MoviesBloc(
    this.getNowPlayingUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRateMoviesUsecase,
  ) : super(MoviesState()) {
    getNowPlayingMovie();

    getpopularMovies();

    getTopRateMovie();
  }

  void getNowPlayingMovie() {
    return on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingUseCase.excute();

      result.fold(
        (failure) {
          emit(state.copyWith(
              requestState: RequestState.error,
              nowPlayingMessageError: failure.message));
        },
        (movies) {
          emit(state.copyWith(
            nowPlayingMovieList: movies,
            requestState: RequestState.loaded,
          ));
        },
      );
    });
  }

  void getTopRateMovie() {
    return on<GetTopRateMoviesEvent>((event, emit) async {
      final result = await getTopRateMoviesUsecase.excute();

      result.fold(
        (failure) {
          emit(MoviesState(
            topRaterequestState: RequestState.error,
            topratedMessageError: failure.message,
          ));
        },
        (movies) {
          emit(MoviesState(
            topRatedList: movies,
            topRaterequestState: RequestState.loaded,
          ));
        },
      );
    });
  }

  void getpopularMovies() {
    return on<GetPopoularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase.excute();

      result.fold(
        (failure) {
          emit(state.copyWith(
            PopuleRequestState: RequestState.error,
            popularMessageError: failure.message,
          ));
        },
        (movies) {
          emit(state.copyWith(
            poplularMovieList: movies,
            PopuleRequestState: RequestState.loaded,
          ));
        },
      );
    });
  }
}
