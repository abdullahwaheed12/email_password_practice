import 'package:email_password_practice/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ForgetPasswrod extends StatelessWidget {
  const ForgetPasswrod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyTextField(text: 'Email', size: size, onChanged: (value) {}),
          ElevatedButton(
              onPressed: () {
                User user = FirebaseAuth.instance.currentUser!;
                user.sendEmailVerification();
              },
              child: Text('send link')),
        ],
      ),
    );
  }
}
