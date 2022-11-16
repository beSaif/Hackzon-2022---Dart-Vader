import 'package:flutter/material.dart';
import 'package:mentai/Screens/RealtimeScreen/component/RealTimeScreenBody.dart';

class RealTimeScreen extends StatefulWidget {
  const RealTimeScreen({super.key});

  @override
  State<RealTimeScreen> createState() => _RealTimeScreenState();
}

class _RealTimeScreenState extends State<RealTimeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: RealTimeScreenBody()),
    );
  }
}
