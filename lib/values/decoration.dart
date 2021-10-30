import 'package:flutter/material.dart';

class Decorations {
  static BoxDecoration boxDecorationForEntireScreen() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xffbdc3c7),
          Color(0xff2c3e50),
        ],
        stops: [
          0,
          1,
        ],
      ),
    );
  }
}
