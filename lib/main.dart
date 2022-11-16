import 'package:flutter/material.dart';
import 'package:mentai/Screens/HomeScreen/home_screen.dart';
import 'package:mentai/navbar_activity.dart';
import 'package:mentai/Screens/LoginScreen/loginscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ment-Ai',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
