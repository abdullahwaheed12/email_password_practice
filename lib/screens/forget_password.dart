import 'package:flutter/material.dart';

class ForgetPasswrod extends StatelessWidget {
  const ForgetPasswrod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Forget password'),
        ],
      ),
    );
  }
}
