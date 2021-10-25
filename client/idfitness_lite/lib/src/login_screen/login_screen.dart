import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 100),
            child: Image(
              image: AssetImage('assets/images/idfitnessLite_logo.png'),
              width: double.infinity,
            ),
          ),
          Column(
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
                width: 200,
                height: 30,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  controller: userNameController,
                ),
              ),
              Text(
                ":סיסמה",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                width: 200,
                height: 30,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  controller: userNameController,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("התחבר"),
          ),
          const Text("Developed by Team ASH", style: TextStyle(fontSize: 12))
        ],
      ),
    );
  }
}
