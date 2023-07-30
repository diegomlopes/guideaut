import 'package:guideaut/features/recomendations/domain/entities/rating_entity.dart';

class RecomendationEntity {
  RecomendationEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.userId,
    required this.ratings,
  });

  final String id;
  final String title;
  final String description;
  final String category;
  final String userId;
  final List<RatingEntity> ratings;

  @override
  String toString() {
    return ""
        'ID: $id, TITLE: $title, DESCRIPTION: $description, CATEGORY: $category, USER: $userId \n'
        'RATINGS: \n$ratings'
        "";
  }
}
