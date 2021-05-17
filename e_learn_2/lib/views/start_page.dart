import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learn/controller/question.dart';
import 'package:e_learn/controller/question_page.dart';
import 'package:e_learn/services/database.dart';
import 'package:e_learn/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home.dart';

List<Question> questionList;

class StartPage extends StatefulWidget {
  final String quizID;
  StartPage(this.quizID);

  @override
  _StartPageState createState() => _StartPageState();
}


class _StartPageState extends State<StartPage> {

  DatabaseService databaseService = new DatabaseService();
  QuerySnapshot questionSnapshot;

  int i = 1;

  void data()async{
    await databaseService.getTestData(widget.quizID).then((value) {
      questionSnapshot = value;
      for (var document in questionSnapshot.docs) {
        List<String> options = [
          document.data()["option1"],
          document.data()["option2"],
          document.data()["option3"],
          document.data()["option4"]
        ];
        options.shuffle();
        Question question = new Question(
            i, document.data()["question"], i, options);
        questionList.add(question);
        i++;
      }
    });
        }

  @override
  void initState(){

      data();
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
      body: QuestionPage(),
    );
  }
}
