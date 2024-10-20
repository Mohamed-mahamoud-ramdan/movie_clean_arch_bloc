import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/movies/domain/base_repository/base_movies_repo.dart';
import 'package:movie/movies/domain/entities/recommendation.dart';

class RecommendatioUseCases {
  final BaseMoviesRepo baseMoviesRepo;

  RecommendatioUseCases({required this.baseMoviesRepo});

  Future<Either<Failure, List<Recommendation>>> excute(
      {required int id}) async {
    return baseMoviesRepo.getRecommendation(id: id);
  }
}
