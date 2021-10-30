import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {Key? key,
      required this.text,
      required this.size,
      required this.onChanged})
      : super(key: key);
  final String text;
  final Size size;
  final void Function(String value) onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '$text:',
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          TextField(
            onChanged: onChanged,
            cursorColor: Colors.white,
            cursorHeight: 30,
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
