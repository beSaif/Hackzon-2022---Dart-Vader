import 'package:flutter/material.dart';
import 'package:mentai/Screens/MyStatistics/components/MyStatisticsBody.dart';

class MyStatistics extends StatefulWidget {
  const MyStatistics({super.key});

  @override
  State<MyStatistics> createState() => _MyStatisticsState();
}

class _MyStatisticsState extends State<MyStatistics> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyStatisticsBody(),
    );
  }
}
