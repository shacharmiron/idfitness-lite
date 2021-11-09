import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../http_requests.dart' as http;
import '../entities/event.dart';
import 'user_provider.dart';

class EventsProvider with ChangeNotifier {
  List<Event> _events = [];

  void initEvents(List<Event> events) {
    _events = events;
    notifyListeners();
  }

  List<Event> get events {
    return [..._events];
  }

  Future<void> fetchAndSetEvents() async {
    List<Event> loadedEvents = [];
    http.getAllEvents().then((res) async {
      var data = jsonDecode(res.body)['data'];
      if (data == null) {
        return;
      }
      for (var event in data) {
        await http.findForceById(event['force_id']).then((force) async {
          await http
              .findEventTypeById(event['event_type_id'])
              .then((eventType) async {
            await http.findUserById(event['created_by']).then((user) {
              loadedEvents.add(Event(
                createdBy: user,
                force: force,
                eventType: eventType,
                eventDate: DateTime.parse(event['event_date']),
                insertionDate: DateTime.parse(event['insertion_date']),
                isDeleted: event['is_deleted'] as bool,
                comment: event['comment'],
                id: event['id'] as int,
              ));
            });
          });
        });
      }
      loadedEvents.sort((a, b) => a.eventDate.isAfter(b.eventDate) ? 1 : -1);
      _events = loadedEvents.toList();
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
