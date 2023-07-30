import 'package:guideaut/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:guideaut/core/no_params.dart';
import 'package:guideaut/core/usecase.dart';
import 'package:guideaut/features/recomendations/data/repositories/recomendations_repository_impl.dart';
import 'package:guideaut/features/recomendations/domain/entities/recomendation_entity.dart';
import 'package:guideaut/features/recomendations/domain/repositories/recomendations_repository.dart';

class GetRecomendations extends Usecase<void, NoParams> {
  GetRecomendations({RecomendationsRepository? repository})
      : repository = repository ?? RecomendationsRepositoryImpl();

  final RecomendationsRepository repository;

  @override
  Future<Either<Failure, List<RecomendationEntity>>> call(
      NoParams params) async {
    return repository.getRecomendations();
  }
}
