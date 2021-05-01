import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'signIn.dart';

class MySplash extends StatefulWidget {
  static String id = 'SplashScreen';
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: SignIn(),
      title: Text(
        'E-Learners',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
      ),
      backgroundColor: Colors.blueGrey,
      photoSize: 60,
      loaderColor: Color(0x004242),
    );
  }
}