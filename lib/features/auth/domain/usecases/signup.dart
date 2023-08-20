import 'package:guideaut/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:guideaut/core/usecase.dart';
import 'package:guideaut/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:guideaut/features/auth/domain/repositories/auth_repository.dart';

class SignUp extends Usecase<void, SignUpParams> {
  SignUp({AuthRepository? repository})
      : repository = repository ?? AuthRepositoryImpl();

  final AuthRepository repository;

  @override
  Future<Either<Failure, void>> call(SignUpParams params) async {
    if (!isValidEmail(params.email)) {
      return Left(InvalidEmail());
    }
    if (!isGoodPassword(params.password)) {
      return Left(WeakPassword());
    }

    if (params.password != params.passwordConfirm) {
      return Left(ConfirmPasswordIsNotEqualsToPassword());
    }

    return repository.createUser(
        params.firstName, params.lastName, params.email, params.password);
  }

  /// Verify if is a valid email.
  bool isValidEmail(String email) {
    final RegExp regex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  /// Verify if is a good password.
  ///
  /// At least 8 characters long
  ///
  /// Contains at least one uppercase letter
  ///
  /// Contains at least one lowercase letter
  ///
  /// Contains at least one digit
  ///
  /// Contains at least one special character (e.g. @, #, $, %, &, *, +, -, /, =, ?, ^, _, ~)
  bool isGoodPassword(String password) {
    final RegExp regex = RegExp(
        r"^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%\^&\*\(\)_\+\-\/=\\\[\]\{\}\|;:\',\.<>\/\?])(?=.{8,})");
    return regex.hasMatch(password);
  }
}

class SignUpParams {
  SignUpParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.passwordConfirm,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String passwordConfirm;
}
