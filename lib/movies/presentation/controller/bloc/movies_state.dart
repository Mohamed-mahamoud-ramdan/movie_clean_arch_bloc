import 'package:equatable/equatable.dart';
import 'package:movie/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final RequestState requestState;
  final RequestState topRaterequestState;
  final RequestState PopuleRequestState;
  final List<Movie> nowPlayingMovieList;
  final List<Movie> poplularMovieList;
  final List<Movie> topRatedList;
  final String nowPlayingMessageError;
  final String popularMessageError;
  final String topratedMessageError;

  const MoviesState(
      {this.PopuleRequestState = RequestState.loading,
      this.topRaterequestState = RequestState.loading,
      this.topratedMessageError = '',
      this.popularMessageError = '',
      this.topRatedList = const [],
      this.poplularMovieList = const [],
      this.requestState = RequestState.loading,
      this.nowPlayingMovieList = const [],
      this.nowPlayingMessageError = ''});

  MoviesState copyWith({
    RequestState? requestState,
    RequestState? topRaterequestState,
    RequestState? PopuleRequestState,
    List<Movie>? nowPlayingMovieList,
    List<Movie>? poplularMovieList,
    List<Movie>? topRatedList,
    String? nowPlayingMessageError,
    String? popularMessageError,
    String? topratedMessageError,
  }) {
    return MoviesState(
        PopuleRequestState: PopuleRequestState ?? this.PopuleRequestState,
        nowPlayingMessageError:
            nowPlayingMessageError ?? this.nowPlayingMessageError,
        nowPlayingMovieList: nowPlayingMovieList ?? this.nowPlayingMovieList,
        poplularMovieList: poplularMovieList ?? this.poplularMovieList,
        popularMessageError: popularMessageError ?? this.popularMessageError,
        topratedMessageError: topratedMessageError ?? this.topratedMessageError,
        topRaterequestState: topRaterequestState ?? this.topRaterequestState,
        topRatedList: topRatedList ?? this.topRatedList,
        requestState: requestState ?? this.requestState);
  }

  @override
  List<Object?> get props => [
        requestState,
        nowPlayingMessageError,
        nowPlayingMovieList,
        poplularMovieList,
        popularMessageError,
        PopuleRequestState,
        topRatedList,
        topratedMessageError,
        topRaterequestState
      ];
}

enum RequestState { loaded, loading, error }
