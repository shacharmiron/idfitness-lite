import 'package:flutter/material.dart';

// All commented code is for signing up...
class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  final Function loginFunc;

  LoginScreen(this.loginFunc);

  final formKey = GlobalKey<FormState>();
  String username = "";
  String password = "";

  void submit(BuildContext ctx) {
    // Save form inputs
    formKey.currentState!.save();

    loginFunc(ctx, username, password);
  }

  // String roleName = "";
  //
  // Future<void> signup(BuildContext ctx) async {
  //   formKey.currentState!.save();
  //   print("on signup");
  //   http.get(Uri.parse('http://10.0.2.2:3000/roles/$roleName')).then((res) {
  //     print(jsonDecode(res.body)['data']);
  //     print(jsonDecode(res.body)['data']['id']);
  //     print((jsonDecode(res.body)['data']['id']).runtimeType);
  //     http.post(
  //       Uri.parse('http://10.0.2.2:3000/signup'),
  //       body: {
  //         "username": username,
  //         "password": password,
  //         "salt": "salt1",
  //         "role_id": jsonDecode(res.body)['data']['id'].toString(),
  //       },
  //     ).then((res) {
  //       print(res.body);
  //     });
  //   });
  // }

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
                    onSaved: (input) {
                      username = input.toString();
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
                    onSaved: (input) {
                      password = input.toString();
                    },
                    textDirection: TextDirection.rtl,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    onFieldSubmitted: (_) => submit(context),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 10),
                //   child: Text(
                //     ":תפקיד",
                //     style: TextStyle(
                //       color: Theme.of(context).colorScheme.primary,
                //       fontSize: 12,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   width: screenWidth / 2,
                //   height: 30,
                //   child: TextFormField(
                //     onSaved: (input) {
                //       roleName = input.toString();
                //     },
                //     textDirection: TextDirection.rtl,
                //     decoration: const InputDecoration(
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(
                //           Radius.circular(10),
                //         ),
                //       ),
                //     ),
                //     onFieldSubmitted: (_) => signup(context),
                //   ),
                // ),
              ],
            ),
          ),
          // Column(
          //   children: [
          ElevatedButton(
            onPressed: () => submit(context),
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
          // ElevatedButton(
          //   onPressed: () => signup(context),
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 25),
          //     child: Text(
          //       "הרשם",
          //       style: TextStyle(
          //           color: Theme.of(context).colorScheme.secondary),
          //     ),
          //   ),
          //   style: ButtonStyle(
          //     shape: MaterialStateProperty.all(
          //       const RoundedRectangleBorder(
          //         borderRadius: BorderRadius.all(
          //           Radius.circular(15),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          //   ],
          // ),
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
