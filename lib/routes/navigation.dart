import 'package:flutter/material.dart';

class NavigationTo {
  static void push(Widget screen, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }

  static void pushAndRemoveUntil(Widget screen, BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => screen,
        ),
        (route) => false);
  }
}
