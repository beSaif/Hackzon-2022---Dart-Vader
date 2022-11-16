import 'package:flutter/material.dart';
import 'package:mentai/Screens/CapturedImageScreen/components/capturedImageScreenBody.dart';

class CapturedImageScreen extends StatefulWidget {
  final List<dynamic> predictions;
  const CapturedImageScreen({super.key, required this.predictions});

  @override
  State<CapturedImageScreen> createState() => _CapturedImageScreenState();
}

class _CapturedImageScreenState extends State<CapturedImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CapturedImageScreenBody(predictions: widget.predictions)),
    );
  }
}
