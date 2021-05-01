import 'package:e_learn/helper/functions.dart';
import 'package:e_learn/views/addQuestion.dart';
import 'package:e_learn/views/create_question.dart';
import 'package:e_learn/views/home.dart';
import 'package:e_learn/views/signIn.dart';
import 'package:e_learn/views/signUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool _isLoggedin = false;

  @override
  void initState() {
    checkUserLoggedInStatus();
    super.initState();
  }

  checkUserLoggedInStatus() async {
    HelperFunction.getUserLogDetails().then((value){
      setState(() {
        _isLoggedin = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

    initialRoute: (_isLoggedin ?? false)?  HomePage.id : SignIn.id,
    routes: {
      SignIn.id: (context) => SignIn(),
      SignUP.id: (context) => SignUP(),
      HomePage.id: (context) => HomePage(),
      CreateQuestions.id: (context) => CreateQuestions(),
      //AddQuestion.id: (context) => AddQuestion(),
    }
     // home: SignIn(),
    );
  }
}


