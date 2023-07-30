import 'package:guideaut/features/recomendations/domain/entities/recomendation_entity.dart';
import 'package:riverpod/riverpod.dart';

final StateProvider<List<RecomendationEntity>> recomendationsProvider =
    StateProvider<List<RecomendationEntity>>(
  (StateProviderRef<List<RecomendationEntity>> ref) => [],
);

final StateProvider<Map<String, List<RecomendationEntity>>>
    searchResultProvider =
    StateProvider<Map<String, List<RecomendationEntity>>>(
  (StateProviderRef<Map<String, List<RecomendationEntity>>> ref) => {},
);
