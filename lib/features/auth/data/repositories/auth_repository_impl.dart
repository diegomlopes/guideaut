import 'package:guideaut/features/auth/data/datasources/auth_firebase_datasource.dart';
import 'package:guideaut/features/auth/domain/entities/enuns/user_roles.dart';
import 'package:guideaut/features/auth/domain/entities/user_entity.dart';
import 'package:guideaut/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:guideaut/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({AuthFirebaseDatasource? firebaseDatasource})
      : firebaseDatasource = firebaseDatasource ?? AuthFirebaseDatasource();

  final AuthFirebaseDatasource firebaseDatasource;

  @override
  Future<Either<Failure, void>> createUser(
      String email, String password) async {
    return await firebaseDatasource
        .createUser(email, password, UserRoles.user)
        .asEither();
  }

  @override
  Future<Either<Failure, void>> forgotPassword(String email) async {
    return await firebaseDatasource.forgotPassword(email).asEither();
  }

  @override
  Future<Either<Failure, void>> signin(String email, String password) async {
    return await firebaseDatasource.signin(email, password).asEither();
  }

  @override
  Future<Either<Failure, void>> signout() async {
    return await firebaseDatasource.signout().asEither();
  }

  @override
  Future<Either<Failure, void>> updateUser(UserEntity user) async {
    return await updateUser(user).asEither();
  }

  @override
  Future<Either<Failure, UserEntity?>> getLoggedUser() async {
    return firebaseDatasource.getLoggedUser().asEither();
  }
}
