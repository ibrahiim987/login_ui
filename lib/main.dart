import 'package:firebase_core/firebase_core.dart'; // Add this
import 'package:flutter/material.dart';
import 'package:login_ui/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for async main
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
