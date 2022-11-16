import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentai/GetX/other_controllers.dart';
import 'package:mentai/GetX/users.dart';
import 'package:mentai/Screens/LoginScreen/loginscreen.dart';
import 'package:mentai/main.dart';

class AppSettingsBody extends StatelessWidget {
  const AppSettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final UsersController usersController =
        Get.put(UsersController(), permanent: false);
    final OtherController otherController =
        Get.put(OtherController(), permanent: false);
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
                onPressed: () async {
                  usersController.resetUser();
                  // otherController.disposeNavBarController();
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => LoginScreen(),
                  //   ),
                  // );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                label: const Text(
                  'Reset Account',
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
