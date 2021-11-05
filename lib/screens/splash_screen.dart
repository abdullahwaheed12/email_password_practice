// ignore_for_file: prefer_const_constructors

import 'package:email_password_practice/routes/navigation.dart';
import 'package:flutter/material.dart';

import '../page_choice.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot<Object?> snapshot;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 2000)).then((_) {
      NavigationTo.push(
          PageChoice(
            snapshot: widget.snapshot,
          ),
          context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
