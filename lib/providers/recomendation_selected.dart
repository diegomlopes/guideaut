import 'package:guideaut/features/recomendations/domain/entities/recomendation_entity.dart';
import 'package:riverpod/riverpod.dart';

final StateProvider<RecomendationEntity?> recomendationSelectedProvider =
    StateProvider<RecomendationEntity?>(
  (StateProviderRef<RecomendationEntity?> ref) => null,
);
