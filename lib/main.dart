import 'package:flutter/material.dart';
import 'package:mentai/Screens/LoginScreen/loginscreen.dart';
import 'package:mentai/Screens/MyStatistics/MyStatistics.dart';
import 'package:camera/camera.dart';
import 'package:mentai/Screens/OnboardingScreen/OnboardingScreen.dart';
import 'package:mentai/navbar_activity.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // home: const LoginScreen(),

      home: NavbarActivity(),
    );
  }
}
