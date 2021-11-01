import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../entities/event.dart';

class EventItem extends StatelessWidget {
  final Event event;

  const EventItem(this.event);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Container(
        width: 130,
        height: 130,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Icon(
              Icons.directions_run,
              color: Theme.of(context).colorScheme.primary,
              size: 64,
            ),
            Text(
              event.eventType,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            Text(
              DateFormat('dd.MM.yy').format(event.eventDate),
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
