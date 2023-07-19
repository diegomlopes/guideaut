import 'package:dartz/dartz.dart';

abstract class Failure {}

class UnknownFailure extends Failure {}

class EmailAlreadyExists extends Failure {}

class WeakPassword extends Failure {}

class UserNotFound extends Failure {}

class WrongPassword extends Failure {}

class InvalidEmail extends Failure {}

extension FunctionalFuture<T> on Future<T> {
  Future<Either<Failure, T>> asEitherFailure() async {
    try {
      return Right(await this);
      // ignore: avoid_catches_without_on_clauses
    } catch (err, stack) {
      return Left(err is Failure ? err : UnknownFailure());
    }
  }

  Future<Either<Failure, T>> asEither() async {
    try {
      return Right(await this);
      // ignore: avoid_catches_without_on_clauses
    } catch (err) {
      return Left(err is Failure ? err : UnknownFailure());
    }
  }
}
