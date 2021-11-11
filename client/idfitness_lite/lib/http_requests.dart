import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'entities/event_type.dart';
import 'entities/force.dart';
import 'entities/event.dart';
import 'entities/result.dart';
import 'entities/soldier.dart';
import 'entities/user.dart';

String baseUrl = 'http://10.0.2.2:3000';

Future<http.Response> login(String username, String password) async {
  return http.post(
    Uri.parse('$baseUrl/login'),
    body: {
      "username": username,
      "password": password,
    },
  );
}

Future<http.Response> getAllEvents() async {
  return http.get(Uri.parse('$baseUrl/events'),
      headers: {'Content-Type': 'application/json'});
}

Future<http.Response> addEvent(Event event) async {
  return http.post(Uri.parse('$baseUrl/events'), body: {
    'event_type_id': event.eventType.id.toString(),
    'force_id': event.force.id.toString(),
    'insertion_date': event.insertionDate.toString(),
    'event_date': event.eventDate.toString(),
    'comment': event.comment,
    'is_deleted': event.isDeleted.toString(),
    'created_by': event.createdBy!.id.toString(),
  });
}

Future<Force> findForceById(int forceId) async {
  return http.get(Uri.parse('$baseUrl/forces/$forceId'),
      headers: {'Content-Type': 'application/json'}).then((res) {
    var data = jsonDecode(res.body)['data'];

    return Force(
      id: data['id'] as int,
      name: data['display_name'],
      parentId: data['parent_id'] != null ? data['parent_id'] as int : null,
    );
  });
}

Future<EventType> findEventTypeById(int eventTypeId) async {
  return http.get(Uri.parse('$baseUrl/eventTypes/$eventTypeId'),
      headers: {'Content-Type': 'application/json'}).then((res) {
    var data = jsonDecode(res.body)['data'];
    return EventType(
      id: data['id'] as int,
      name: data['display_name'],
    );
  });
}

Future<User> findUserById(int userId) async {
  return http.get(Uri.parse('$baseUrl/users/$userId'),
      headers: {'Content-Type': 'application/json'}).then((res) {
    var data = jsonDecode(res.body)['data'];

    return User(
      id: data['id'] as int,
      username: data['username'],
      roleId: data['role_id'] as int,
      salt: data['salt'],
    );
  });
}

Future<Event> findEventById(int eventId) async {
  return http.get(Uri.parse('$baseUrl/events/$eventId'),
      headers: {'Content-Type': 'application/json'}).then((res) {
    var data = jsonDecode(res.body)['data'];

    return findForceById(data['force_id']).then((force) {
      return findUserById(data['created_by']).then((user) {
        return findEventTypeById(data['event_type_id']).then((eventType) {
          return Event(
            comment: data['comment'],
            eventDate: DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                .parse(data['event_date']),
            insertionDate: DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                .parse(data['insertion_date']),
            isDeleted: data['is_deleted'],
            id: data['id'],
            eventType: eventType,
            force: force,
            createdBy: user,
          );
        });
      });
    });
  });
}

Future<Soldier> findSoldierById(int soldierId) async {
  return http.get(Uri.parse('$baseUrl/soldiers/$soldierId'),
      headers: {'Content-Type': 'application/json'}).then((res) {
    var data = jsonDecode(res.body)['data'];

    return findForceById(data['force_id']).then((force) {
      return findUserById(data['user_id']).then((user) {
        return Soldier(
          id: data['id'],
          force: force,
          firstName: data['first_name'],
          lastName: data['last_name'],
          height: data['height'],
          weight: data['weight'],
          user: user,
          dateOfBirth: DateFormat('dd.MM.yyyy').parse(data['date_of_birth']),
        );
      });
    });
  });
}

Future<List<Result>> findResultsByEvent(int eventId) async {
  List<Result> loadedResults = [];
  return http.get(Uri.parse('$baseUrl/results/event/$eventId'),
      headers: {'Content-Type': 'application/json'}).then((res) async {
    var data = jsonDecode(res.body)['data'];

    for (var result in data) {
      await findEventById(result['event_id']).then((event) async {
        await findSoldierById(result['soldier_id']).then((soldier) {
          loadedResults.add(Result(
            id: result['id'],
            insertionDate: DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                .parse(result['insertion_date']),
            result: result['result'],
            event: event,
            soldier: soldier,
          ));
        });
      });
    }
    return loadedResults;
  });
}
