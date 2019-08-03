import 'package:flutter/material.dart';
import 'package:ung_modern/screens/home.dart';

// This is Constructor
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
