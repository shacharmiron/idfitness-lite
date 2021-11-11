import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../entities/user.dart';
import '../widgets/last_events.dart';
import '../widgets/avg_results.dart';
import '../widgets/leader_board.dart';
import '../providers/events_provider.dart';
import '../providers/user_provider.dart';
import '../providers/results_provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      await Provider.of<ResultsProvider>(context, listen: false)
          .fetchAndSetResults();
      await Provider.of<EventsProvider>(context, listen: false)
          .fetchAndSetEvents();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    User user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              '${user.username}שלום ',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
        centerTitle: true,
        titleTextStyle:
            TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LastEvents(),
            AvgResults(),
            LeaderBoard(),
          ],
        ),
      ),
    );
  }
}
