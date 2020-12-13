import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'piano_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Piano App',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Piano(title: 'Natural Keys'),
    );
  }
}

