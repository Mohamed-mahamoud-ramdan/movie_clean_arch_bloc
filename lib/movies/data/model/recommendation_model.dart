import 'package:movie/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  RecommendationModel({required super.dorpDownPath, required super.id});

  factory RecommendationModel.formjson({required Map<String, dynamic> json}) {
    return RecommendationModel(
        dorpDownPath:
            json['backdrop_path'] ?? "/yZWHpr5HlKTDlPf46UH8RSlEOu9.jpg",
        id: json['id']);
  }
}
