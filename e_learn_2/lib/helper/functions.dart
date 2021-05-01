import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction{

  static String userLoggedInKey ="USERLOGGEDINKEY";

  static saveUserLogDetails({@required bool isLoggedin}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(userLoggedInKey, isLoggedin);

  }
  static Future<bool> getUserLogDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userLoggedInKey);
  }
}