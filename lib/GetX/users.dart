import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  var users = {
    'hisham@gmail.com': '12345',
    'jum@g.c': '12345',
  };

  List<Map<String, dynamic>> data = [];

  int photosTaken = 0;
  int streaks = 0;

  void updatePhotosTaken() {
    photosTaken++;
    debugPrint('photosTaken: $photosTaken');
    update();
  }

  void updateStreaks() {
    streaks++;
    debugPrint('streaks: $streaks');
    update();
  }

  void signUpUser(String user, String password) {
    var newuser = {user: password};
    users.addEntries(newuser.entries);
    debugPrint('Added user $user');
  }

  void updateData(var newData) {
    data = newData;
    debugPrint('Added data $newData');
  }
}
