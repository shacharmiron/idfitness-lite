import 'force.dart';
import 'user.dart';

class Soldier {
  final int id;
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;
  final Force force;
  final User user;
  final int weight;
  final int height;

  Soldier({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.force,
    required this.user,
    required this.weight,
    required this.height,
  });
}
