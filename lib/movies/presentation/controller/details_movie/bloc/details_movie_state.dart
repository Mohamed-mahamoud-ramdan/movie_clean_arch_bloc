import 'package:equatable/equatable.dart';
import 'package:movie/movies/domain/entities/movie_details.dart';
import 'package:movie/movies/domain/entities/recommendation.dart';
import 'package:movie/movies/presentation/controller/bloc/movies_state.dart';

class DetailsMovieState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState detailRequestState;
  final String message;
  final List<Recommendation>? recommendation;
  final RequestState? recommendationState;
  final String recomendationErrorMessage;

  DetailsMovieState({
    this.recommendation = const [],
    this.recommendationState = RequestState.loading,
    this.recomendationErrorMessage = '',
    this.detailRequestState = RequestState.loading,
    this.message = '',
    this.movieDetails,
  });

  DetailsMovieState copyWith({
    RequestState? detailRequestState,
    String? message,
    MovieDetails? movieDetails,
    RequestState? recomendationdatate, // Typo retained as per your request
    String? recomendantionError, // Typo retained as per your request
    List<Recommendation>? reommendation, // Typo retained as per your request
  }) {
    return DetailsMovieState(
      recomendationErrorMessage:
          recomendantionError ?? recomendationErrorMessage,
      recommendation: reommendation ?? recommendation,
      recommendationState: recomendationdatate ?? recommendationState,
      detailRequestState: detailRequestState ?? this.detailRequestState,
      message: message ?? this.message,
      movieDetails: movieDetails ?? this.movieDetails,
    );
  }

  @override
  List<Object?> get props => [
        detailRequestState,
        movieDetails,
        message,
        recomendationErrorMessage,
        recommendation,
        recommendationState
      ];
}
