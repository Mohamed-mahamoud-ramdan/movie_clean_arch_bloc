import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/movies/domain/base_repository/base_movies_repo.dart';
import 'package:movie/movies/domain/entities/movie.dart';

class GetTopRateMoviesUsecase {
  final BaseMoviesRepo baseMoviesRepo;

  GetTopRateMoviesUsecase({required this.baseMoviesRepo});
  Future<Either<Failure, List<Movie>>> excute() async {
    return await baseMoviesRepo.getTopRatedMoveis();
  }
}
