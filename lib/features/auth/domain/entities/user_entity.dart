import 'package:guideaut/features/auth/domain/entities/enuns/user_roles.dart';

class UserEntity {
  String? id;
  String email;
  String? password;
  String? photoUrl;
  String? firstName;
  String? lastName;
  UserRoles role;

  UserEntity({
    required this.email,
    required this.role,
    this.id,
    this.password,
    this.photoUrl,
    this.firstName,
    this.lastName,
  });
}
