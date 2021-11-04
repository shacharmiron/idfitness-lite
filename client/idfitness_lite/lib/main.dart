import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'http_requests.dart' as http;
import 'entities/event.dart';
import 'providers/events_provider.dart';
import 'providers/user_provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/tabs_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  UserProvider? userProvider;

  Future<void> login(BuildContext ctx, String username, String password) async {
    Provider.of<UserProvider>(ctx, listen: false)
        .loginUser(ctx, username, password)
        .then((res) {
      if (res) {
        Navigator.of(ctx).pushNamed(TabsScreen.routeName);
      }
    });
  }

  void createEvent(BuildContext ctx, Event event) {
    userProvider = Provider.of<UserProvider>(ctx, listen: false);
    event.createdBy = userProvider!.user;

    http.addEvent(event).then((response) {
      var res = jsonDecode(response.body);
      Navigator.of(ctx).pop();
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(res['message'], textAlign: TextAlign.center),
          width: MediaQuery.of(ctx).size.width / 2,
          backgroundColor: Theme.of(ctx).colorScheme.primary,
          behavior: SnackBarBehavior.floating,
          elevation: 6.0,
          duration: const Duration(seconds: 1),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => EventsProvider(),
        ),
      ],
      child: MaterialApp(
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
          scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1),
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
          HomeScreen.routeName: (ctx) => HomeScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(login),
          TabsScreen.routeName: (ctx) => TabsScreen(),
        },
      ),
    );
  }
}
