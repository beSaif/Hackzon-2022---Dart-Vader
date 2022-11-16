import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentai/GetX/users.dart';

class CapturedImageScreenBody extends StatefulWidget {
  final List<dynamic> predictions;
  const CapturedImageScreenBody({super.key, required this.predictions});

  @override
  State<CapturedImageScreenBody> createState() =>
      _CapturedImageScreenBodyState();
}

class _CapturedImageScreenBodyState extends State<CapturedImageScreenBody> {
  final UsersController usersController =
      Get.put(UsersController(), permanent: false);
  List<Map<String, dynamic>> data = [];
  List colors = [
    Colors.blue[400],
    Colors.red[400],
    Colors.green[400],
    Colors.orange[400],
    Colors.yellow[400],
    Colors.brown[400],
  ];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.predictions.length; i++) {
      data.insert(i, {
        'domain': widget.predictions[i]['label'],
        'measure': widget.predictions[i]['confidence'],
        'color': colors[i]
      });
    }

    usersController.updateData(data);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              icon: const Icon(Icons.chevron_left)),
          Center(
            child: Text(
              'Your Mood',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 400,
            child: DChartPie(
              data: data,
              fillColor: (pieData, index) {
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
                                color: data[index]['color'],
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          const SizedBox(
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
