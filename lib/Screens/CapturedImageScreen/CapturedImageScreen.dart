import 'package:camera/camera.dart';
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
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: CapturedImageScreenBody(predictions: widget.predictions),
    );
  }
}
