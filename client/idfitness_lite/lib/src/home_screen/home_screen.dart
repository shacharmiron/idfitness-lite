import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        toolbarHeight: screenHeight / 6,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                DateFormat('EEEE, dd.MM.yyyy', 'he_IL').format(DateTime.now()),
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Text(
              'hello name name',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
        centerTitle: true,
        titleTextStyle:
            TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
