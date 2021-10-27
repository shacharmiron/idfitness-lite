import 'package:flutter/material.dart';

import '../home_screen/home_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  final formKey = GlobalKey<FormState>();

  void login(BuildContext ctx) {
    formKey.currentState!.save();

    // if authentication returns ok:
    Navigator.of(ctx).pushNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight / 10),
            child: const Image(
              image: AssetImage('assets/images/idfitnessLite_logo.png'),
              width: double.infinity,
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  ":שם משתשמש",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: screenWidth / 2,
                  height: 30,
                  child: TextFormField(
                    onSaved: (username) {
                      print(username);
                    },
                    textDirection: TextDirection.rtl,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    ":סיסמה",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth / 2,
                  height: 30,
                  child: TextFormField(
                    onSaved: (password) {
                    },
                    textDirection: TextDirection.rtl,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    onFieldSubmitted: (_) => login(context),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => login(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "התחבר",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Text(
            "Developed by Team ASH",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
