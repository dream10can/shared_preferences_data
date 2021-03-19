import 'package:flutter/material.dart';
import 'package:shared_preferences_example/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MianScreen(),
    );
  }
}
