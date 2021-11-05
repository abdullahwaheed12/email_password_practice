// ignore_for_file: prefer_const_constructors

import 'package:email_password_practice/routes/navigation.dart';
import 'package:email_password_practice/widgets/button.dart';
import 'package:email_password_practice/widgets/spacer.dart';
import 'package:flutter/material.dart';

import 'sign_in_screens/sign_in.dart';

class UserSelection extends StatelessWidget {
  const UserSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('User Selection'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                  bgColor: Colors.blue,
                  text: 'Admin',
                  onPressed: null,
                  size: size),
              SpaceH16(),
              CustomButton(
                  bgColor: Colors.blue,
                  text: 'Manager',
                  onPressed: null,
                  size: size),
              SpaceH16(),
              CustomButton(
                  bgColor: Colors.blue,
                  text: 'Team Lead',
                  onPressed: null,
                  size: size),
              SpaceH16(),
              CustomButton(
                  bgColor: Colors.blue,
                  text: 'Employee',
                  onPressed: () {
                    NavigationTo.push(const SignIn(), context);
                  },
                  size: size)
            ],
          ),
        ),
      ),
    );
  }
}
