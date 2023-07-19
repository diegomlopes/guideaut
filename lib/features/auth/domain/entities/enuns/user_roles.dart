enum UserRoles {
  user,
  moderator,
  admin,
}

extension UserRolesExtension on UserRoles {
  static fromString(String role) {
    switch (role) {
      case "user":
        return UserRoles.user;
      case "moderator":
        return UserRoles.moderator;
      case "admin":
        return UserRoles.admin;
      default:
        break;
    }
  }

  String get nameStr {
    switch (this) {
      case UserRoles.user:
        return "user";
      case UserRoles.moderator:
        return "moderator";
      case UserRoles.admin:
        return "admin";
      default:
        return "user";
    }
  }
}
