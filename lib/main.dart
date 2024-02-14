import 'package:bmi_calculater/screens/homescreen.dart';
import 'package:bmi_calculater/screens/resultscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI CALCULATER',
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: Homescreen(),
    );
  }
}
