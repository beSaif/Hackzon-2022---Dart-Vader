import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 25,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue[100]),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.settings,
                          color: Colors.blue[300],
                          size: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Edit',
                          style: GoogleFonts.poppins(
                            color: Colors.blue[300],
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
            SizedBox(
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
            SizedBox(
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
                    SizedBox(
                      width: 14,
                    ),
                    Icon(
                      Icons.military_tech,
                      color: Colors.blue[300],
                      size: 18,
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
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 65,
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
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Text(
                      '7',
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
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
