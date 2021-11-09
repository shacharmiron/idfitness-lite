import 'event.dart';
import 'soldier.dart';

class Result {
  final int id;
  final DateTime insertionDate;
  final int result;
  final Event event;
  final Soldier soldier;

  Result({
    required this.id,
    required this.insertionDate,
    required this.result,
    required this.event,
    required this.soldier,
  });
}
