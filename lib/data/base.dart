import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/models/user_model.dart';

class Pref {

  static List<User> users = [];

  static addUser(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    users.add(user);
    String prefs = jsonEncode(user);
    preferences.setString('user', prefs);
  }

  static Future<User> loadUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? user = preferences.getString('user');
    Map<String, dynamic> map = jsonDecode(user!);
    return User.fromJson(map);
  }
}