import 'dart:ui';

import 'package:email_password_practice/routes/navigation.dart';
import 'package:email_password_practice/values/decoration.dart';
import 'package:email_password_practice/values/string.dart';
import 'package:email_password_practice/widgets/button.dart';
import 'package:email_password_practice/widgets/spacer.dart';
import 'package:flutter/material.dart';

import 'sign_in.dart';
import 'sign_up.dart';

class Hello extends StatefulWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  late Size size;
  @override
  void didChangeDependencies() {
    size = Size(MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height - 86);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(StringConst.WELCOM_SCREEN)),
      body: Container(
        decoration: Decorations.boxDecorationForEntireScreen(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //10%
            SizedBox(
              width: double.infinity,
              height: size.height * 0.1,
            ),
            const Text(
              StringConst.HELLOTHERE,
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
            //5%
            MySpacer(
              size: size,
            ),
            qutesText(),
            //1%
            MySpacer(
              size: size,
              heightFactor: 0.1,
            ),
            //25%
            Image.asset(
              'assets/officeMen.png',
              height: size.height * 0.25,
              width: size.width * 0.8,
              fit: BoxFit.fill,
            ),
            //10%
            MySpacer(
              size: size,
              heightFactor: 0.1,
            ),
            //8%
            //Sign in
            CustomButton(
              bgColor: Colors.blue,
              text: StringConst.SIGN_IN,
              size: size,
              onPressed: () {
                NavigationTo.push(const SignIn(), context);
              },
            ),
            //0.5%
            MySpacer(
              size: size,
            ),
            //8%
            //Sign up
            CustomButton(
              bgColor: Colors.red,
              text: StringConst.SIGN_UP,
              size: size,
              onPressed: () {
                NavigationTo.push(const SignUp(), context);
              },
            ),
          ],
        ),
      ),
    );
  }

  //_________helping methods and composed widget______________
  ///
//  Qutes Text
  ///

  Widget qutesText() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: const Text(
        StringConst.AUTOMETIC_IDENTITY_LINE,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
