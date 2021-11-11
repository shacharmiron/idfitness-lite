import 'package:flutter/material.dart';

import '../entities/result.dart';
import '../http_requests.dart' as http;

class ResultsProvider with ChangeNotifier {
  List<Result> _results = [];

  Future<void> fetchAndSetResults() async {
    http.getAllResults().then((results) {
      _results = results;
      notifyListeners();
    });
  }

  List<Result> getResultsOfEvent(int eventId) {
    return _results.where((result) => result.event.id == eventId).toList();
  }
}
