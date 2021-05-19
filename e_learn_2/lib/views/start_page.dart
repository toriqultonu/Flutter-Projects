import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learn/controller/question.dart';
import 'package:e_learn/controller/question_page.dart';
import 'package:e_learn/services/database.dart';
import 'package:e_learn/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home.dart';


class StartPage extends StatefulWidget {
  final String quizID;
  StartPage(this.quizID);

  @override
  _StartPageState createState() => _StartPageState();
}


class _StartPageState extends State<StartPage> {



  @override
  void initState(){

      super.initState();
      }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Get.to(() => HomePage()),
          child: Icon(
            Icons.navigate_before,
            color: Colors.black54,
          ),
        ),
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text('Skip'),
          ),
        ],
      ),
      body: QuestionPage(widget.quizID),
    );
  }
}
