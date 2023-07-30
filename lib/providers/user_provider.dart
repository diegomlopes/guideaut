import 'package:guideaut/features/auth/domain/entities/user_entity.dart';
import 'package:riverpod/riverpod.dart';

final StateProvider<UserEntity?> loggedUserProvider =
    StateProvider<UserEntity?>(
  (StateProviderRef<UserEntity?> ref) => null,
);
