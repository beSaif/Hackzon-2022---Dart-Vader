import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class MyStatisticsBody extends StatelessWidget {
  const MyStatisticsBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {'domain': 'Anger', 'measure': 28, 'color': Colors.green[400]},
      {'domain': 'Sad', 'measure': 27, 'color': Colors.orange[400]},
      {'domain': 'Happy', 'measure': 20, 'color': Colors.blue[400]},
      {'domain': 'Disgust', 'measure': 15, 'color': Colors.red[400]},
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                  'My Statistics',
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
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, bottom: 30),
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
                            '${data[index]['measure'].toString()}%',
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
        ),
      ),
    );
  }
}
