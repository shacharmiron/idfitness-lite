import 'package:flutter/material.dart';

import 'add_event_dialog.dart';

class AddEvent extends StatelessWidget {
  final Function addEventFunc;

  const AddEvent(this.addEventFunc);

  void openAddEventDialog(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (_) {
        return AddEventDialog(addEventFunc);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        onTap: () {
          openAddEventDialog(context);
        },
        child: Container(
          width: 130,
          height: 130,
          padding: const EdgeInsets.all(10),
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.primary,
            size: 110,
          ),
        ),
      ),
    );
  }
}
