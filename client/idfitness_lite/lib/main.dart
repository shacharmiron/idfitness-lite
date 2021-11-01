import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/screens/login_screen.dart';
import 'src/screens/home_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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

      home: LoginScreen(),

      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
      },
    );
  }
}
