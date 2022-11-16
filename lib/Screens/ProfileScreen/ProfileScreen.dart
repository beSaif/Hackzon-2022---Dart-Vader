import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentai/Screens/AppSettingsScreen/AppSettings.dart';
import 'package:mentai/Screens/HelpScreen/Help.dart';
import 'package:mentai/Screens/InviteScreen/Invite.dart';
import 'package:mentai/Screens/MyStatistics/MyStatistics.dart';
import 'package:mentai/Screens/ProMemberScreen/ProMember.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Image image = Image.asset('assets/Images/My project.png');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(
                    height: 25,
                  ),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     height: 25,
                  //     width: 70,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(20),
                  //         color: Colors.blue[100]),
                  //     child: Row(
                  //       children: [
                  //         SizedBox(
                  //           width: 7,
                  //         ),
                  //         Icon(
                  //           Icons.settings,
                  //           color: Colors.blue[300],
                  //           size: 18,
                  //         ),
                  //         SizedBox(
                  //           width: 5,
                  //         ),
                  //         Text(
                  //           'Edit',
                  //           style: GoogleFonts.poppins(
                  //             color: Colors.blue[300],
                  //             fontSize: 15,
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CircleAvatar(
                  foregroundImage: image.image,
                  backgroundColor: Colors.blue[100],
                  radius: 75,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Rishi Singh',
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Container(
                  height: 25,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[100]),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.military_tech,
                        color: Colors.blue[300],
                        size: 25,
                      ),
                      Text(
                        'Advanced',
                        style: GoogleFonts.poppins(
                          color: Colors.blue[300],
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 70,
                  ),
                  Column(
                    children: [
                      Text(
                        '147',
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Photos Taken',
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  Column(
                    children: [
                      Text(
                        '78',
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Streaks Now',
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: 345,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          debugPrint('pro clicked');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProMember(),
                              ));
                        },
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.lightBlue[100]),
                              child: Icon(
                                Icons.wb_twilight,
                                size: 35,
                                color: Colors.blue[400],
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Become a Pro Member',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 67,
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          debugPrint('stats');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyStatistics(),
                              ));
                        },
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.lightBlue[100]),
                              child: Icon(
                                Icons.insights,
                                size: 35,
                                color: Colors.blue[400],
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              'My Statistics',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 140,
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          debugPrint('settings');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AppSettings(),
                              ));
                        },
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.lightBlue[100]),
                              child: Icon(
                                Icons.settings,
                                size: 35,
                                color: Colors.blue[400],
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              'App Settings',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 140,
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        endIndent: 10,
                        indent: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          debugPrint('invite');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Invite(),
                              ));
                        },
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.lightBlue[100]),
                              child: Icon(
                                Icons.person_add,
                                size: 35,
                                color: Colors.blue[400],
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Invite a Friend',
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 130,
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          debugPrint('invite');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Help(),
                              ));
                        },
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.lightBlue[100]),
                              child: Icon(
                                Icons.sms,
                                size: 35,
                                color: Colors.blue[400],
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Help',
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 203,
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
