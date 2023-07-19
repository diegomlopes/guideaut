import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guideaut/features/admin_panel/recomendations/domain/entities/category.dart';

class RecomendationFirebaseDatasource {
  Future<List<Category>> getCategories() async {
    final categoriesRef = FirebaseFirestore.instance.collection('categories');
    final categoriesDoc = await categoriesRef.get();

    List<Category> categories = [];

    categoriesDoc.docs.forEach((categoryJson) {
      categories.add(Category.fromJson(categoryJson.data()));
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
}
