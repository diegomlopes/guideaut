import 'package:guideaut/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:guideaut/core/no_params.dart';
import 'package:guideaut/core/usecase.dart';
import 'package:guideaut/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:guideaut/features/auth/domain/entities/user_entity.dart';
import 'package:guideaut/features/auth/domain/repositories/auth_repository.dart';

class GetLoggedUser extends Usecase<UserEntity?, NoParams> {
  GetLoggedUser({AuthRepository? repository})
      : repository = repository ?? AuthRepositoryImpl();

  final AuthRepository repository;

  @override
  Future<Either<Failure, UserEntity?>> call(NoParams params) {
    return repository.getLoggedUser();
  }
}
