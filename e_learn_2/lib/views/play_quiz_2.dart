import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learn/models/questionModel.dart';
import 'package:e_learn/services/database.dart';
import 'package:e_learn/views/result.dart';
import 'package:e_learn/widgets/appBar.dart';
import 'package:e_learn/widgets/quiz_play_widget.dart';
import 'package:flutter/material.dart';

class PlayQuiz2 extends StatefulWidget {

  final String quizID;
  PlayQuiz2(this.quizID);

  @override
  _PlayQuiz2State createState() => _PlayQuiz2State();

}
int total = 0;
int correct = 0;
int incorrect = 0;
int notAttempted = 0;
int i = 0;
int timer = 30;
bool canceltimer = false;
String showtimer = "30";
Color colorshow = Colors.cyanAccent;
Color right = Colors.green;
Color wrong = Colors.red;

Map<int, Color> btncolor = {
  1 : Colors.cyanAccent,
  2 : Colors.cyanAccent,
  3 : Colors.cyanAccent,
  4 : Colors.cyanAccent
};
class _PlayQuiz2State extends State<PlayQuiz2> {

  DatabaseService databaseService = new DatabaseService();
  QuerySnapshot questionSnapshot;

  @override
  void initState() {
    databaseService.getTestData(widget.quizID).then((value){
      questionSnapshot = value;
    
      notAttempted = 0;
      correct = 0;
      total = questionSnapshot.docs.length;
      print("$total this is total ${widget.quizID}");
      setState(() {

      });
    });
    starttimer();
    super.initState();
  }

    QuestionModel getQuestionModelFromDataSnapshot(DocumentSnapshot qsnSnapshot){

    QuestionModel questionModel = new QuestionModel();
    questionModel.question = qsnSnapshot.data()["question"];
    List<String> options = [
      qsnSnapshot.data()["option1"],
      qsnSnapshot.data()["option2"],
      qsnSnapshot.data()["option3"],
      qsnSnapshot.data()["option4"]
    ];
      options.shuffle();
    questionModel.option1 = options[0];
    questionModel.option2 = options[1];
    questionModel.option3 = options[2];
    questionModel.option4 = options[3];
    questionModel.correctOption = qsnSnapshot.data()["option1"];
    questionModel.answer = false;
    return questionModel;
  }


  void starttimer() async{
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if(timer < 1){
          t.cancel();
          nextQuestion();
        }
        else if(canceltimer == true){
          t.cancel();
        }
        else{
          timer = timer -1 ;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextQuestion(){
    canceltimer = false;
    timer = 30;
      setState(() {
        if(i<total-1){
          i++;
        }
       else{
          Navigator.push(context, MaterialPageRoute(builder: (context) => Results()
          ));
        }
        btncolor[1] = Colors.cyanAccent;
        btncolor[2] = Colors.cyanAccent;
        btncolor[3] = Colors.cyanAccent;
        btncolor[4] = Colors.cyanAccent;
      });
    starttimer();
  }

  void checkans(String k, int op){
    if(!getQuestionModelFromDataSnapshot(questionSnapshot.docs[i]).answer){

      ///correct
      if(getQuestionModelFromDataSnapshot(questionSnapshot.docs[i]).correctOption == k){
        colorshow = right;
        getQuestionModelFromDataSnapshot(questionSnapshot.docs[i]).answer = true;
        correct = correct + 1;
        notAttempted = notAttempted - 1;
        setState(() {
            canceltimer = true;
            btncolor[op] = colorshow;
        });
      }
      ///incorrect
      else{
        colorshow = wrong;
        getQuestionModelFromDataSnapshot(questionSnapshot.docs[i]).answer = true;
        incorrect = incorrect + 1;
        notAttempted = notAttempted - 1;
        setState(() {
          canceltimer = true;
          btncolor[op] = colorshow;
        });
      }
      Timer(Duration(seconds: 2), nextQuestion);
    }

  }

  Widget choicebutton(String k, int op){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0
      ),
      child: MaterialButton(
        onPressed: (){
          checkans(k,op);
        },
        child: Text(
          k, style: TextStyle(color: Colors.white, fontSize: 16),
          maxLines: 1,
        ),
        color: btncolor[op],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 45.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    QuestionModel questionModel =  getQuestionModelFromDataSnapshot(questionSnapshot.docs[i]);
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
            color: Colors.black54
        ),
        brightness: Brightness.light,
      ),
      body:Column(
        children: [
          Expanded(
            flex: 3,
            child: Text(questionModel.question, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
          ),
          Expanded(
            flex: 6,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  choicebutton(questionModel.option1, 1),
                  choicebutton(questionModel.option2, 2),
                  choicebutton(questionModel.option3, 3),
                  choicebutton(questionModel.option4, 4),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Center(
                child: Text(showtimer, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
              ),
            ),
          )
        ],
      )
    );
  }
}

//getQuestionModelFromDataSnapshot(questionSnapshot.docs[i])