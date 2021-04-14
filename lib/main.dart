import 'package:flutter/material.dart';
import 'package:store/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store',
      home: Home(),
    );
  }
}
