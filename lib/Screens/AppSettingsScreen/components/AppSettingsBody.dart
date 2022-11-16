import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppSettingsBody extends StatelessWidget {
  const AppSettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: const Icon(Icons.chevron_left)),
        Center(
            child: Text('App Settings',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ))),
        Expanded(
          child: Center(
            child: ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                label: const Text(
                  'Delete Account',
                  style: TextStyle(
                      fontFamily: 'Halenoir',
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )),
          ),
        ),
      ],
    );
  }
}
