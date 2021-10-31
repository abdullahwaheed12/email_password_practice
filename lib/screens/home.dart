import 'package:email_password_practice/routes/navigation.dart';
import 'package:email_password_practice/values/custom_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screens/sign_in.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.email, required this.name})
      : super(key: key);
  final String name;
  final String email;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) async {
              switch (value) {
                case 'Logout':
                  {
                    await firebaseAuth.signOut();
                    firebaseAuth.authStateChanges().listen(
                      (User? user) {
                        if (user == null) {
                          NavigationTo.pushAndRemoveUntil(
                              const SignIn(), context);
                          CustomSnackBar.showSnackBar(
                              'user is logout', context);
                        } else {
                          CustomSnackBar.showSnackBar(
                              'User is signed in', context);
                        }
                      },
                    );
                    CustomSnackBar.showSnackBar('Click logout', context);
                    break;
                  }
                case 'Settings':
                  {
                    CustomSnackBar.showSnackBar('Click Settings', context);
                    break;
                  }
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Logout', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            Text('user name : ${widget.name}'),
            Text('user email : ${widget.email}'),
          ],
        ),
      ),
    );
  }
}
