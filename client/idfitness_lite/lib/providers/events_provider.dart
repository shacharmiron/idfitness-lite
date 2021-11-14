import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../http_requests.dart' as http;
import '../entities/event.dart';
import 'user_provider.dart';

class EventsProvider with ChangeNotifier {
  List<Event> _events = [];
  int lastEventsAmount = 5;

  List<Event> get events {
    return [..._events];
  }

  List<Event> get lastEvents {
    return [..._events].sublist(0, min(_events.length, lastEventsAmount));
  }

  Future<void> fetchAndSetEvents() async {
    http.getAllEvents().then((events) {
      _events = events.toList();
      notifyListeners();
    });
  }

  void addEvent(BuildContext ctx, Event event) {
    _events.add(event);

    UserProvider userProvider = Provider.of<UserProvider>(ctx, listen: false);
    event.createdBy = userProvider.user;

    http.addEvent(event).then((response) {
      var res = jsonDecode(response.body);
      Navigator.of(ctx).pop();
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
    });

    notifyListeners();
  }
}
