import 'package:bloc/bloc.dart';

import 'package:movie/movies/domain/use_cases/details_movie_use_case/detail_use_case.dart';
import 'package:movie/movies/domain/use_cases/recommendatio_use_cases/recommendatio_use_cases.dart';
import 'package:movie/movies/presentation/controller/bloc/movies_state.dart';

import 'package:movie/movies/presentation/controller/details_movie/bloc/details_movie_event.dart';
import 'package:movie/movies/presentation/controller/details_movie/bloc/details_movie_state.dart';

class DetailsMovieBloc extends Bloc<DetailsMovieEvent, DetailsMovieState> {
  final DetailUseCase detailUseCase;
  final RecommendatioUseCases recommendatioUseCases;
  DetailsMovieBloc(this.detailUseCase, this.recommendatioUseCases)
      : super(DetailsMovieState()) {
    on<GetMovieDatailsEvetn>((event, emit) async {
      final result = await detailUseCase.excute(id: event.id);
      result.fold(
        (l) {
          emit(state.copyWith(
              message: l.message, detailRequestState: RequestState.error));
        },
        (r) {
          emit(state.copyWith(
              movieDetails: r, detailRequestState: RequestState.loaded));
        },
      );
    });
    on<RecommandationEvent>((event, emit) async {
      final result = await recommendatioUseCases.excute(id: event.id);
      result.fold(
        (l) {
          emit(state.copyWith(
              message: l.message, recomendationdatate: RequestState.error));
        },
        (r) {
          emit(state.copyWith(
              reommendation: r, recomendationdatate: RequestState.loaded));
        },
      );
    });
  }
}
