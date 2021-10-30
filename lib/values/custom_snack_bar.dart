// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class CustomSnackBar {
  static showSnackBar(String text, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
