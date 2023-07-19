import 'package:dartz/dartz.dart';
import 'package:guideaut/core/failures.dart';
import 'package:guideaut/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> signin(String email, String password);
  Future<Either<Failure, void>> signout();
  Future<Either<Failure, void>> createUser(String email, String password);
  Future<Either<Failure, void>> updateUser(UserEntity user);
  Future<Either<Failure, void>> forgotPassword(String email);
  Future<Either<Failure, UserEntity?>> getLoggedUser();
}
