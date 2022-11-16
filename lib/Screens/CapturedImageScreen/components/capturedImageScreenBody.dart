import 'dart:io';

import 'package:camera/camera.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentai/main.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;

class CapturedImageScreenBody extends StatefulWidget {
  final List<dynamic> predictions;
  const CapturedImageScreenBody({super.key, required this.predictions});

  @override
  State<CapturedImageScreenBody> createState() =>
      _CapturedImageScreenBodyState();
}

class _CapturedImageScreenBodyState extends State<CapturedImageScreenBody> {
  List<Map<String, dynamic>> data = [];

  @override
  Widget build(BuildContext context) {
    Color random =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    for (int i = 0; i < widget.predictions.length; i++) {
      data.insert(i, {
        'domain': widget.predictions[i]['label'],
        'measure': widget.predictions[i]['confidence'],
        'color': random
      });
    }
    print(data);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: DChartPie(
              data: data,
              fillColor: (pieData, index) {
                // switch (pieData['domain']) {
                //   case 'Flutter':
                //     return Colors.green[400];
                //   case 'React Native':
                //     return Colors.orange[400];
                //   case 'Ionic':
                //     return Colors.blue[400];
                //   default:
                //     return Colors.red[400];
                // }

                return data[index!]['color'];
              },
              donutWidth: 80,
              labelColor: Colors.white,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 50, right: 50, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 15,
                            width: 30,
                            decoration: BoxDecoration(
                                color: data[index!]['color'],
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            data[index]['domain'].toString(),
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Text(
                        '${(data[index]['measure'] * 100).toStringAsFixed(0)}%',
                        style: GoogleFonts.poppins(
                          color: Colors.green[300],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
