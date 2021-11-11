import 'package:flutter/material.dart';

import '../entities/soldier.dart';
import '../http_requests.dart' as http;

class SoldiersProvider with ChangeNotifier {
  List<Soldier> _soldiers = [];

  List<Soldier> get soldiers {
    return [..._soldiers];
  }

  Future<void> fetchAndSetSoldiers() async {
    http.getAllSoldiers().then((soldiers) {
      _soldiers = soldiers;
      notifyListeners();
    });
  }
}
