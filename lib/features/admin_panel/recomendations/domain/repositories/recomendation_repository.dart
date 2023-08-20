import 'package:dartz/dartz.dart';
import 'package:guideaut/core/failures.dart';
import 'package:guideaut/features/recomendations/domain/entities/category_entity.dart';
import 'package:guideaut/features/recomendations/domain/entities/recomendation_entity.dart';

abstract class RecomendationRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, CategoryEntity>> addCategory(CategoryEntity category);
  Future<Either<Failure, RecomendationEntity>> addRecomendation(
      RecomendationEntity recomendation);
  // Future<Either<Failure, void>> removeRecomendation(
  //     RecomendationEntity recomendation);
}
