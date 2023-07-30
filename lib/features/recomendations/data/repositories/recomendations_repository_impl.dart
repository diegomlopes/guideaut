import 'package:dartz/dartz.dart';
import 'package:guideaut/core/failures.dart';
import 'package:guideaut/features/recomendations/data/datasources/recomendations_firebase_datasouce.dart';
import 'package:guideaut/features/recomendations/domain/entities/rating_entity.dart';
import 'package:guideaut/features/recomendations/domain/entities/recomendation_entity.dart';
import 'package:guideaut/features/recomendations/domain/repositories/recomendations_repository.dart';

class RecomendationsRepositoryImpl implements RecomendationsRepository {
  RecomendationsRepositoryImpl(
      {RecomendationsFirebaseDatasource? firebaseDatasource})
      : firebaseDatasource =
            firebaseDatasource ?? RecomendationsFirebaseDatasource();

  final RecomendationsFirebaseDatasource firebaseDatasource;

  @override
  Future<Either<Failure, List<RecomendationEntity>>> getRecomendations() async {
    return await firebaseDatasource.getRecomendations().asEither();
  }

  @override
  Future<Either<Failure, void>> ratingRecomendations(
      RecomendationEntity recomendation, RatingEntity rating) async {
    return await firebaseDatasource
        .ratingRecomendation(recomendation, rating)
        .asEither();
  }
}
