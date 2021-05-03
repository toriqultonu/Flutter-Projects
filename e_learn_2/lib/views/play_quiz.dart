import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learn/models/questionModel.dart';
import 'package:e_learn/services/database.dart';
import 'package:e_learn/widgets/appBar.dart';
import 'package:e_learn/widgets/quiz_play_widget.dart';
import 'package:flutter/material.dart';

class PlayQuiz extends StatefulWidget {

  final String quizID;
  PlayQuiz(this.quizID);

  @override
  _PlayQuizState createState() => _PlayQuizState();
}

int total = 0;
int correct = 0;
int incorrect = 0;
int notAttempted = 0;

class _PlayQuizState extends State<PlayQuiz> {

  DatabaseService databaseService = new DatabaseService();
  QuerySnapshot questionSnapshot;

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

  @override
  void initState() {
    print("${widget.quizID}");
    databaseService.getTestData(widget.quizID).then((value){
      questionSnapshot = value;
      notAttempted = 0;
      correct = 0;
      total = questionSnapshot.docs.length;
      print("$total this is total ${widget.quizID}");
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        child: Column(
          children: [
            questionSnapshot.docs == null ? Container():
                ListView.builder(
                  shrinkWrap: true,
                 // physics: ClampingScrollPhysics(),
                  itemCount: questionSnapshot.docs.length,
                  itemBuilder: (context, index){
                    return QuizPlayTile(
                          questionModel: getQuestionModelFromDataSnapshot(questionSnapshot.docs[index]),
                          index: index,
                    );
                  },

                )
          ],
        ),
      ),
    );
  }
}

class QuizPlayTile extends StatefulWidget {

  final QuestionModel questionModel;
  final int index;
  QuizPlayTile({this.questionModel, this.index});

  @override
  _QuizPlayTileState createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {

  String optionSelected = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Text(widget.questionModel.question),
            SizedBox(height: 4,),
            OptionTile(
              correctAns: widget.questionModel.option1,
              description: widget.questionModel.option1,
              option: "A",
              optionSelected: optionSelected,
            ),
            SizedBox(height: 4,),
            OptionTile(
              correctAns: widget.questionModel.option1,
              description: widget.questionModel.option2,
              option: "B",
              optionSelected: optionSelected,
            ),
            SizedBox(height: 4,),
            OptionTile(
              correctAns: widget.questionModel.option1,
              description: widget.questionModel.option3,
              option: "C",
              optionSelected: optionSelected,
            ),
            SizedBox(height: 4,),
            OptionTile(
              correctAns: widget.questionModel.option1,
              description: widget.questionModel.option4,
              option: "D",
              optionSelected: optionSelected,
            )
          ],
        ),
    );
  }
}

