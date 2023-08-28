import 'package:guideaut/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:guideaut/core/usecase.dart';
import 'package:guideaut/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:guideaut/features/auth/domain/repositories/auth_repository.dart';

class ForgotPassword extends Usecase<void, ForgotPasswordParams> {
  ForgotPassword({AuthRepository? repository})
      : repository = repository ?? AuthRepositoryImpl();

  final AuthRepository repository;

  @override
  Future<Either<Failure, void>> call(ForgotPasswordParams params) async {
    return repository.forgotPassword(params.email);
  }
}

class ForgotPasswordParams {
  ForgotPasswordParams({
    required this.email,
  });

  final String email;
}
