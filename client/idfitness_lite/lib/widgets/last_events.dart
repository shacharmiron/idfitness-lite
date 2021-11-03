import 'package:flutter/material.dart';

import '../entities/event.dart';
import '../entities/user.dart';
import '../entities/event_type.dart';
import '../entities/force.dart';
import 'event_item.dart';

class LastEvents extends StatelessWidget {
  final User user;

  LastEvents(this.user);

  @override
  Widget build(BuildContext context) {
    Event event = Event(
      eventType: EventType(id: 3, name: 'אימון'),
      force: Force(id: 6, name: 'force1'),
      insertionDate: DateTime.now().subtract(const Duration(days: 1)),
      eventDate: DateTime.now().add(const Duration(days: 1)),
      comment: 'this is my comment',
      isDeleted: false,
      createdBy: user,
    );

    return Row(children: [
      EventItem(event),
    ]);
  }
}
