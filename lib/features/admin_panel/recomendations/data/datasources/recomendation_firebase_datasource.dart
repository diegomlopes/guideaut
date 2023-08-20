import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guideaut/features/recomendations/domain/entities/category_entity.dart';
import 'package:guideaut/features/recomendations/domain/entities/recomendation_entity.dart';

class RecomendationFirebaseDatasource {
  Future<List<CategoryEntity>> getCategories() async {
    final categoriesRef = FirebaseFirestore.instance.collection('categories');
    final categoriesDoc = await categoriesRef.get();

    List<CategoryEntity> categories = [];

    categoriesDoc.docs.forEach((categoryJson) {
      categories.add(CategoryEntity.fromJson(categoryJson.data()));
    });
    // if (userDoc.data() != null) {
    //   final data = userDoc.data();
    //   return UserEntity(
    //     email: data?['email'],
    //     photoUrl: data?['photoUrl'],
    //     firstName: data?['firstName'],
    //     lastName: data?['lastName'],
    //     role: UserRolesExtension.fromString(data?['role']),
    //   );
    // }
    return categories;
  }

  Future<void> removeRecomendation(RecomendationEntity recomendation) async {}

  // Future<List<RecomendationEntity>> getUserRecomendations(
  //     UserEntity user) async {
  //   final result = await FirebaseFirestore.instance
  //       .collection('recomendations')
  //       .where('userId', isEqualTo: (user.id))
  //       .get();

  // }
}
