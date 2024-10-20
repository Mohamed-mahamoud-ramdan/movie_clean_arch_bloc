import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  final String dorpDownPath;
  final int id;

  Recommendation({required this.dorpDownPath, required this.id});

  @override
  List<Object?> get props => [dorpDownPath, id];
}
