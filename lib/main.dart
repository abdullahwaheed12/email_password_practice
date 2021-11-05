import 'package:email_password_practice/screens/splash_screen.dart';
import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [MyApp] is rebuilt, that
/// would re-initialize FlutterFire and make our Myapplication re-enter loading state,
/// which is undesired.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // Create the initialization Future outside of `build`:
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// The future is part of the state of our widget. We should not call `initializeMyApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        return MaterialApp(
          home: SplashScreen(
            snapshot: snapshot,
          ),
        );
      },
    );
  }
}
