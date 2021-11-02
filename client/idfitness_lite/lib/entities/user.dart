class User {
  final int id;
  final String username;
  final String salt;
  final int roleId;

  User({
    required this.id,
    required this.username,
    required this.salt,
    required this.roleId,
  });
}
