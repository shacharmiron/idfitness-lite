import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/events_provider.dart';
import '../entities/event.dart';
import 'event_item.dart';

class LastEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const int amountOfLastEvents = 5;
    List<Event> events = Provider.of<EventsProvider>(context).events;

    return Column(children: [
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            child: const Text(
              "הצג הכל",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {},
          ),
          const Text(
            "אירועים אחרונים",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 150,
        child: ListView.builder(
          shrinkWrap: true,
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemCount: min(amountOfLastEvents, events.length),
          itemBuilder: (ctx, index) {
            return EventItem(events[index]);
          },
        ),
      ),
    ]);
  }
}
