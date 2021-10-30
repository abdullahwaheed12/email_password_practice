import 'package:email_password_practice/screens/login_screens/hello.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/loading.dart';
import 'screens/login_screens/sign_in.dart';
import 'screens/something_wrong.dart';
import 'values/custom_snack_bar.dart';

class PageChoice extends StatelessWidget {
  const PageChoice({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot<Object?> snapshot;

  @override
  Widget build(BuildContext context) {
    // Check for errors
    if (snapshot.hasError) {
      return const SomethingWentWrong();
    }
    // Once complete, show your Myapplication
    if (snapshot.connectionState == ConnectionState.done) {
      Widget page;
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        CustomSnackBar.showSnackBar('Signing in ', context);
        page = const SignIn();
      } else {
        page = Home(email: user.email!, name: user.displayName!);
      }
      return page;
    }
    // Otherwise, show something whilst waiting for initialization to complete
    return const Loading();
  }
}
