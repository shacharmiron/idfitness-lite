import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../entities/user.dart';

class AddEventDialog extends StatefulWidget {
  final User user;

  AddEventDialog(this.user);

  @override
  State<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  DateTime? selectedDate;
  String date = '';
  String comment = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        date = DateFormat('dd.MM.yy').format(selectedDate!);
      });
    }
  }

  void createEvent(BuildContext context) {
    http.post(Uri.parse('http://10.0.2.2:3000/events'), body: {
      'event_type_id': '3',
      'force_id': '6',
      'insertion_date': DateTime.now().toString(),
      'event_date': selectedDate.toString(),
      'comment': comment,
      'is_deleted': 'false',
      'created_by': widget.user.id.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: AlertDialog(
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        title: const Center(
          child: Text(
            "אימון חדש",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)))),
              backgroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(196, 196, 196, 1),
              ),
              foregroundColor: MaterialStateProperty.all(Colors.black),
            ),
            child: const Text(
              "הזן",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              createEvent(context);
            },
          ),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)))),
              backgroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(196, 196, 196, 1),
              ),
              foregroundColor: MaterialStateProperty.all(Colors.black),
            ),
            child: const Icon(Icons.delete_outline),
            onPressed: () {},
          ),
        ],
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(right: 5),
                      height: 30,
                      width: 2 * screenWidth / 5,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 30),
                            Text(
                              date,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Icon(Icons.date_range_outlined),
                          ]),
                    ),
                  ),
                  const Text("תאריך"),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "פרטי האימון",
              ),
            ),
            TextField(
              onChanged: (input) {
                comment = input;
              },
              textAlign: TextAlign.right,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
