import 'package:dartz/dartz.dart';
import 'package:guideaut/core/failures.dart';
import 'package:guideaut/features/recomendations/domain/entities/rating_entity.dart';
import 'package:guideaut/features/recomendations/domain/entities/recomendation_entity.dart';

abstract class RecomendationsRepository {
  Future<Either<Failure, void>> ratingRecomendations(
    RecomendationEntity recomendation,
    RatingEntity rating,
  );

  Future<Either<Failure, List<RecomendationEntity>>> getRecomendations();
}
