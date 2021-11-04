import 'event_type.dart';
import 'force.dart';
import 'user.dart';

class Event {
  int? id;
  EventType eventType;
  Force force;
  DateTime insertionDate;
  DateTime eventDate;
  String comment;
  bool isDeleted;
  User? createdBy;

  Event({
    this.id,
    required this.eventType,
    required this.force,
    required this.insertionDate,
    required this.eventDate,
    required this.comment,
    required this.isDeleted,
    this.createdBy,
  });
}
