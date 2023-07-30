import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guideaut/features/recomendations/domain/entities/rating_entity.dart';
import 'package:guideaut/features/recomendations/domain/entities/recomendation_entity.dart';

class RecomendationsFirebaseDatasource {
  Future<void> ratingRecomendation(
      RecomendationEntity recomendation, RatingEntity rating) async {
    final recomendationRef = FirebaseFirestore.instance
        .collection('recomendations')
        .doc(recomendation.id);

    await recomendationRef.update({
      "ratings": FieldValue.arrayUnion([
        {
          "user_id": recomendation.userId,
          "rate": rating.rate,
        }
      ])
    });
  }

  Future<List<RecomendationEntity>> getRecomendations() async {
    List<RecomendationEntity> recomendations = [];

    final recomendationsRef =
        await FirebaseFirestore.instance.collection('recomendations').get();

    for (var doc in recomendationsRef.docs) {
      final id = doc.id;
      final title = doc['title'] as String;
      final description = doc['description'] as String;
      final category = doc['category'] as String;
      final userId = doc['userId'] as String;
      final ratingsJson = doc['ratings'] ?? [];

      List<RatingEntity> ratings = [];

      for (var rateJson in ratingsJson) {
        final rate = (rateJson as Map)['rate'];

        ratings.add(RatingEntity(rate: rate, userId: userId));
      }
      recomendations.add(
        RecomendationEntity(
          id: id,
          title: title,
          description: description,
          category: category,
          userId: userId,
          ratings: ratings,
        ),
      );
    }

    return recomendations;
  }
}
