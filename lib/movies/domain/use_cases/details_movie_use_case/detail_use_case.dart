import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';

import 'package:movie/movies/domain/base_repository/base_movies_repo.dart';
import 'package:movie/movies/domain/entities/movie_details.dart';

class DetailUseCase {
  final BaseMoviesRepo baseMoviesRepo;

  DetailUseCase({required this.baseMoviesRepo});

  Future<Either<Failure, MovieDetails>> excute({required int id}) async {
    return await baseMoviesRepo.getDetailsMovei(id: id);
  }
}
