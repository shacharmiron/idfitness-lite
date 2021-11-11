import 'package:flutter/material.dart';

import '../entities/result.dart';
import '../http_requests.dart' as http;

class ResultsProvider with ChangeNotifier {
  List<Result> _results = [];

  List<Result> get results {
    return [..._results];
  }

  Future<void> fetchAndSetResults() async {
    http.getAllResults().then((results) {
      _results = results;
      notifyListeners();
    });
  }

  List<Result> getResultsOfEvent(int eventId) {
    return _results.where((result) => result.event.id == eventId).toList();
  }

  List<Result> getResultsOfSoldier(int soldierId) {
    return _results.where((result) => result.soldier.id == soldierId).toList();
  }

  double getResultsAvg(List<Result> results) {
    int amount = results.length;
    int sum = results.fold(0, (previousValue, result) {
      return previousValue + result.result;
    });
    return amount == 0 ? 0.1 : sum / amount;
  }
}
