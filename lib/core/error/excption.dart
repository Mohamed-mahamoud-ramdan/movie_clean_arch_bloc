import 'package:movie/core/network/error_message_models/error_message_model_movie.dart';

class ServerException implements Exception {
  final ErrorMessageModelmovie errorMessageModelmovie;

  ServerException({required this.errorMessageModelmovie});
}
