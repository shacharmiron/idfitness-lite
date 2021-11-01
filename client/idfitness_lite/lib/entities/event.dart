import 'user.dart';

class Event {
  String eventType;
  String force;
  DateTime insertionDate;
  DateTime eventDate;
  String comment;
  bool isDeleted;
  User createdBy;

  Event({
    required this.eventType,
    required this.force,
    required this.insertionDate,
    required this.eventDate,
    required this.comment,
    required this.isDeleted,
    required this.createdBy,
  });
}
