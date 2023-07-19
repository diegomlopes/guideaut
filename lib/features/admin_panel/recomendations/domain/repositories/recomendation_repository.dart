import 'package:dartz/dartz.dart';
import 'package:guideaut/core/failures.dart';
import 'package:guideaut/features/admin_panel/recomendations/domain/entities/category.dart';
import 'package:guideaut/features/admin_panel/recomendations/domain/entities/recomendation.dart';

abstract class RecomendationRepository {
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, Category>> addCategory(Category category);
  Future<Either<Failure, Recomendation>> addRecomendation(
      Recomendation recomendation);
}
