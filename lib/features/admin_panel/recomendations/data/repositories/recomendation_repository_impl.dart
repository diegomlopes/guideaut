import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guideaut/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:guideaut/features/admin_panel/recomendations/data/datasources/recomendation_firebase_datasource.dart';
import 'package:guideaut/features/admin_panel/recomendations/domain/entities/category.dart';
import 'package:guideaut/features/admin_panel/recomendations/domain/entities/recomendation.dart';
import 'package:guideaut/features/admin_panel/recomendations/domain/repositories/recomendation_repository.dart';

class RecomendationRepositoryImpl implements RecomendationRepository {
  RecomendationRepositoryImpl(
      {RecomendationFirebaseDatasource? firebaseDatasource})
      : firebaseDatasource =
            firebaseDatasource ?? RecomendationFirebaseDatasource();

  final RecomendationFirebaseDatasource firebaseDatasource;

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    return firebaseDatasource.getCategories().asEither();
  }

  @override
  Future<Either<Failure, Category>> addCategory(Category category) async {
    final userRef = FirebaseFirestore.instance.collection('categories');
    await userRef.add({
      'text': category.text,
      'value': category.value,
    });

    return Right(category);
  }

  @override
  Future<Either<Failure, Recomendation>> addRecomendation(
      Recomendation recomendation) async {
    final userRef = FirebaseFirestore.instance.collection('recomendations');
    await userRef.add({
      'title': recomendation.title,
      'category': recomendation.category,
      'description': recomendation.description,
      'userId': recomendation.userId
    });

    return Right(recomendation);
  }
}
