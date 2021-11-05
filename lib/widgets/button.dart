import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.bgColor,
      required this.text,
      this.onPressed,
      required this.size})
      : super(key: key);
  final String text;
  final Color bgColor;
  final Size size;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
          primary: bgColor,
          elevation: 20,
          fixedSize: Size(size.width * 0.9, size.height * 0.08),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      onPressed: onPressed,
    );
  }
}
