import 'dart:io';

import 'package:flutter/material.dart';

class CapturedImageScreenBody extends StatefulWidget {
  final String imageFile;
  const CapturedImageScreenBody({super.key, required this.imageFile});

  @override
  State<CapturedImageScreenBody> createState() =>
      _CapturedImageScreenBodyState();
}

class _CapturedImageScreenBodyState extends State<CapturedImageScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300,
          height: 300,
          child: Image.file(File(widget.imageFile)),
        ),
      ],
    );
  }
}
