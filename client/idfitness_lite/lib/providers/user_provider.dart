import 'dart:convert';

import 'package:flutter/material.dart';

import '../http_requests.dart' as http;
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

  Future<bool> loginUser(BuildContext ctx, String username, String password) {
    bool loggedIn = false;
    return http.login(username, password).then((response) {
      var res = jsonDecode(response.body);

      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(res['message'], textAlign: TextAlign.center),
          duration: const Duration(milliseconds: 500),
          width: MediaQuery.of(ctx).size.width / 2,
          backgroundColor: Theme.of(ctx).colorScheme.primary,
          behavior: SnackBarBehavior.floating,
          elevation: 6.0,
        ),
      );

      // if authentication returns ok update user
      if (response.statusCode == 200) {
        var data = res['data'];
        _user = User(
          id: data['id'],
          username: data['username'],
          roleId: data['role_id'],
          salt: data['salt'],
        );
        loggedIn = true;
      }
      notifyListeners();
      return loggedIn;
    });
  }
}
