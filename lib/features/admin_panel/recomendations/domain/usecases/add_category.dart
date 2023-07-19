import 'package:guideaut/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:guideaut/core/usecase.dart';
import 'package:guideaut/features/admin_panel/recomendations/data/repositories/recomendation_repository_impl.dart';
import 'package:guideaut/features/admin_panel/recomendations/domain/entities/category.dart';
import 'package:guideaut/features/admin_panel/recomendations/domain/repositories/recomendation_repository.dart';

class AddCategory extends Usecase<Category, AddCategoryParams> {
  AddCategory({RecomendationRepository? repository})
      : repository = repository ?? RecomendationRepositoryImpl();

  final RecomendationRepository repository;

  @override
  Future<Either<Failure, Category>> call(AddCategoryParams params) async {
    return repository.addCategory(params.category);
  }
}

class AddCategoryParams {
  AddCategoryParams({required this.category});

  final Category category;
}
