//@dart=2.9
import 'package:basic_implement_ui_3/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Travelkuy",
      home: HomeScreen(),
    );
  }
}
