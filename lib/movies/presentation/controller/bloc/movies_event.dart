import 'package:equatable/equatable.dart';

class MoviesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetNowPlayingMoviesEvent extends MoviesEvent {}

class GetPopoularMoviesEvent extends MoviesEvent {}

class GetTopRateMoviesEvent extends MoviesEvent {}
