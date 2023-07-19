import 'package:guideaut/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:guideaut/core/usecase.dart';
import 'package:guideaut/features/admin_panel/recomendations/data/repositories/recomendation_repository_impl.dart';
import 'package:guideaut/features/admin_panel/recomendations/domain/entities/recomendation.dart';
import 'package:guideaut/features/admin_panel/recomendations/domain/repositories/recomendation_repository.dart';

class AddRecomendation extends Usecase<Recomendation, AddRecomendationParams> {
  AddRecomendation({RecomendationRepository? repository})
      : repository = repository ?? RecomendationRepositoryImpl();

  final RecomendationRepository repository;

  @override
  Future<Either<Failure, Recomendation>> call(
      AddRecomendationParams params) async {
    return repository.addRecomendation(params.recomendation);
  }
}

class AddRecomendationParams {
  AddRecomendationParams({required this.recomendation});

  final Recomendation recomendation;
}
