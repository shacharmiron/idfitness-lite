import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;

import 'entities/user.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/tabs_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late User user;

  Future<void> login(BuildContext ctx, String username, String password) async {
    // Authenticate the user
    http.post(
      Uri.parse('http://10.0.2.2:3000/login'),
      body: {
        "username": username,
        "password": password,
      },
    ).then((response) {
      // if authentication returns ok go to home screen and update user
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        user = User(
          id: data['id'],
          username: data['username'],
          roleId: data['role_id'],
          salt: data['salt'],
        );

        Navigator.of(ctx).pushNamed(TabsScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
      restorationScopeId: 'app',

      // Provide the generated AppLocalizations to the MaterialApp. This
      // allows descendant Widgets to display the correct translations
      // depending on the user's locale.
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('he', 'IL'), // Israeli Hebrew
      ],

      // The appTitle is defined in .arb files found in the localization
      // directory.
      // onGenerateTitle: (BuildContext context) =>
      //     AppLocalizations.of(context)!.appTitle,

      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color.fromRGBO(50, 80, 46, 1),
          secondary: Color.fromRGBO(236, 231, 180, 1),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1:
                  TextStyle(color: Theme.of(context).colorScheme.primary),
              bodyText2:
                  TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
      ),
      darkTheme: ThemeData.dark(),
      // themeMode: settingsController.themeMode,

      home: LoginScreen(login),

      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(user),
        LoginScreen.routeName: (ctx) => LoginScreen(login),
        TabsScreen.routeName: (ctx) => TabsScreen(user),
      },
    );
  }
}
