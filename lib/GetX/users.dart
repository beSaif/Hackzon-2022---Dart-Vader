import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  var users = {
    'hisham@gmail.com': '12345',
    'jum@g.c': '12345',
  };

  void signUpUser(String user, String password) {
    var newuser = {user: password};
    users.addEntries(newuser.entries);
    debugPrint('Added user $user');
  }

  List<Map<String, dynamic>> data = [];

  void updateData(var newData) {
    data = newData;
    debugPrint('Added data $newData');
  }
}
