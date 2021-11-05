// ignore_for_file: avoid_print

import 'package:email_password_practice/routes/navigation.dart';
import 'package:email_password_practice/screens/home.dart';
import 'package:email_password_practice/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPasswrod extends StatelessWidget {
  const ForgetPasswrod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var email = '';
    var emailLink = 'https://auth.example.com/emailSignInLink';
    var firebaseAuth = FirebaseAuth.instance;
    var acs = ActionCodeSettings(
        // URL you want to redirect back to. The domain (www.example.com) for this
        // URL must be whitelisted in the Firebase Console.
        url: emailLink,
        // This must be true
        handleCodeInApp: true,
        iOSBundleId: 'com.example.ios',
        androidPackageName: 'com.example.email_password_practice',
        // installIfNotAvailable
        androidInstallApp: true,
        // minimumVersion
        androidMinimumVersion: '16');

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.5),
      appBar: AppBar(
        title: const Text('Forget Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(
                text: 'Email',
                size: size,
                onChanged: (value) {
                  email = value;
                }),
            ElevatedButton(
                child: const Text('send link'),
                onPressed: () async {
                  await firebaseAuth
                      .sendSignInLinkToEmail(
                          email: email, actionCodeSettings: acs)
                      .catchError((onError) =>
                          print('Error sending email verification $onError'))
                      .then(
                        (value) =>
                            print('Successfully sent email verification'),
                      );
                  if (firebaseAuth.isSignInWithEmailLink(emailLink)) {
                    // The client SDK will parse the code from the link for you.
                    firebaseAuth
                        .signInWithEmailLink(email: email, emailLink: emailLink)
                        .then((value) {
                      // You can access the new user via value.user
                      // Additional user info profile *not* available via:
                      // value.additionalUserInfo.profile == null
                      // You can check if the user is new or existing:
                      // value.additionalUserInfo.isNewUser;
                      var userEmail = value.user;
                      print('Successfully signed in with email link!');
                      NavigationTo.push(
                          Home(
                              email: email,
                              name: userEmail!.phoneNumber ?? 'null'),
                          context);
                    }).catchError((onError) {
                      print('Error signing in with email link $onError');
                    });
                  }
                }),
          ],
        ),
      ),
    );
  }
}
