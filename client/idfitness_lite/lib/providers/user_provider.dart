import 'package:flutter/material.dart';

import '../entities/user.dart';

class UserProvider with ChangeNotifier {
  late User _user;

  User get user {
    return User(
      id: _user.id,
      username: _user.username,
      roleId: _user.roleId,
      salt: _user.salt,
    );
  }

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
