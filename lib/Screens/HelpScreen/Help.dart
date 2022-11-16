import 'package:flutter/material.dart';
import 'package:mentai/Screens/HelpScreen/components/HelpBody.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HelpBody()),
    );
  }
}
