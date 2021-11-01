class User {
  final String username;
  final String salt;
  final int roleId;

  User({
    required this.username,
    required this.salt,
    required this.roleId,
  });
}
