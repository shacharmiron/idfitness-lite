import 'package:flutter/material.dart';

import 'home_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late final List<Widget> _screens = [HomeScreen(), HomeScreen(), HomeScreen()];

  int _selectedScreenIndex = 2;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: const Color.fromRGBO(141, 130, 130, 1),
          currentIndex: _selectedScreenIndex,
          iconSize: 28,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.people), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_outlined), label: ""),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
            ),
          ]),
    );
  }
}
