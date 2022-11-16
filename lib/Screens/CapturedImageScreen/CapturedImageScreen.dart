import 'package:cross_file/src/types/interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mentai/Screens/CapturedImageScreen/components/capturedImageScreenBody.dart';

class CapturedImageScreen extends StatefulWidget {
  final String imageFile;
  const CapturedImageScreen({super.key, required this.imageFile});

  @override
  State<CapturedImageScreen> createState() => _CapturedImageScreenState();
}

class _CapturedImageScreenState extends State<CapturedImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Captured Image'),
      ),
      body: CapturedImageScreenBody(imageFile: widget.imageFile),
    );
  }
}
