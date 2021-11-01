import 'package:flutter/material.dart';

import '../entities/event.dart';
import '../entities/user.dart';
import 'event_item.dart';

class LastEvents extends StatelessWidget {
  final User user;

  LastEvents(this.user);

  @override
  Widget build(BuildContext context) {
    Event event = Event(
      eventType: 'אימון',
      force: 'force1',
      insertionDate: DateTime.now().subtract(Duration(days: 1)),
      eventDate: DateTime.now().add(Duration(days: 1)),
      comment: 'this is my comment',
      isDeleted: false,
      createdBy: user,
    );

    return EventItem(event);
  }
}
