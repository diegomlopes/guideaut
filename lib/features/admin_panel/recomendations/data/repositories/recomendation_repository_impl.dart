import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guideaut/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:guideaut/features/admin_panel/recomendations/data/datasources/recomendation_firebase_datasource.dart';
import 'package:guideaut/features/recomendations/domain/entities/category_entity.dart';
import 'package:guideaut/features/admin_panel/recomendations/domain/repositories/recomendation_repository.dart';
import 'package:guideaut/features/recomendations/domain/entities/recomendation_entity.dart';

class RecomendationRepositoryImpl implements RecomendationRepository {
  RecomendationRepositoryImpl(
      {RecomendationFirebaseDatasource? firebaseDatasource})
      : firebaseDatasource =
            firebaseDatasource ?? RecomendationFirebaseDatasource();

  final RecomendationFirebaseDatasource firebaseDatasource;

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    return firebaseDatasource.getCategories().asEither();
  }

  @override
  Future<Either<Failure, CategoryEntity>> addCategory(
      CategoryEntity category) async {
    final userRef = FirebaseFirestore.instance.collection('categories');
    await userRef.add({
      'text': category.text,
      'value': category.value,
    });

    return Right(category);
  }

  @override
  Future<Either<Failure, RecomendationEntity>> addRecomendation(
      RecomendationEntity recomendation) async {
    final userRef = FirebaseFirestore.instance.collection('recomendations');
    await userRef.add({
      'title': recomendation.title,
      'category': recomendation.category,
      'description': recomendation.description,
      'userId': recomendation.userId,
      'ratings': [],
    });

    return Right(recomendation);
  }

  // @override
  // Future<Either<Failure, void>> removeRecomendation(
  //     RecomendationEntity recomendation) async {
  //   final recomendationRef = FirebaseFirestore.instance
  //       .collection('recomendations')
  //       .doc(recomendation.id);

  //   var documentoSnapshot = await recomendationRef.get();
  //   if (documentoSnapshot.exists) {
  //     await recomendationRef.delete();
  //   }
  // }
}
