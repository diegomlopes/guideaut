import 'package:guideaut/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:guideaut/core/usecase.dart';
import 'package:guideaut/features/recomendations/data/repositories/recomendations_repository_impl.dart';
import 'package:guideaut/features/recomendations/domain/entities/rating_entity.dart';
import 'package:guideaut/features/recomendations/domain/entities/recomendation_entity.dart';
import 'package:guideaut/features/recomendations/domain/repositories/recomendations_repository.dart';

class RatingRecomendation extends Usecase<void, RatingParams> {
  RatingRecomendation({RecomendationsRepository? repository})
      : repository = repository ?? RecomendationsRepositoryImpl();

  final RecomendationsRepository repository;

  @override
  Future<Either<Failure, void>> call(RatingParams params) async {
    return repository.ratingRecomendations(params.recomendation, params.rating);
  }
}

class RatingParams {
  RatingParams({required this.recomendation, required this.rating});

  final RecomendationEntity recomendation;
  final RatingEntity rating;
}
