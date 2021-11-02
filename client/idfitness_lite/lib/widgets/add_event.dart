import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../entities/user.dart';
import 'add_event_dialog.dart';

class AddEvent extends StatelessWidget {
  final User user;

  const AddEvent(this.user);

  void addEvent(BuildContext ctx) {
    print("try to open dialog...");
    showDialog(
      context: ctx,
      builder: (_) {
        return AddEventDialog(user);
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
          addEvent(context);
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
