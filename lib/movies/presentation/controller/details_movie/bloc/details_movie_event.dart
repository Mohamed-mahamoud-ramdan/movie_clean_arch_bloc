import 'package:equatable/equatable.dart';

class DetailsMovieEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetMovieDatailsEvetn extends DetailsMovieEvent {
  final int id;

  GetMovieDatailsEvetn({required this.id});

  @override
  List<Object?> get props => [id];
}

class RecommandationEvent extends DetailsMovieEvent {
  final int id;

  RecommandationEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
