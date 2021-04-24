import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learn/services/database.dart';
import 'package:e_learn/views/addQuestion.dart';
import 'package:e_learn/widgets/appBar.dart';
import 'package:e_learn/widgets/blueButton.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';


class CreateQuestions extends StatefulWidget {
  static String id = 'CreateQuestions';
  @override
  _CreateQuestionsState createState() => _CreateQuestionsState();
}

class _CreateQuestionsState extends State<CreateQuestions> {
  final _formKey = GlobalKey<FormState>();
  String questionImageURL, questionTitle, questionDescription, questionID;
 // DatabaseService databaseService = new DatabaseService();
  bool _isloading = false;
  DatabaseService databaseService = new DatabaseService();


  createQuestionOnline() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isloading = true;
      });
         questionID = randomAlphaNumeric(16);
      Map<String, String> questionMap = {
        "qsnID": questionID,
        "qsnImgURL": questionImageURL,
        "qsnTitle": questionTitle,
        "qsnDescript": questionDescription
      };
      await databaseService.addQuestionData(questionMap,questionID).whenComplete((){
        setState(() {
          _isloading = false;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>AddQuestion(questionID)
          ));
        });
      });

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: _isloading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    TextFormField(
                      //validator: (value){ return value.isEmpty ? "Enter correct name": null;},
                      decoration: InputDecoration(
                        hintText: 'Question Image URL(Optional)',
                      ),
                      onChanged: (value) {
                        questionImageURL = value;
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      validator: (value) {
                        return value.isEmpty
                            ? "Enter correct question title"
                            : null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Question Title',
                      ),
                      onChanged: (value) {
                        questionTitle = value;
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      validator: (value) {
                        return value.isEmpty
                            ? "Enter correct question description"
                            : null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Question Description',
                      ),
                      onChanged: (value) {
                        questionDescription = value;
                      },
                    ),
                     Spacer(),
                    GestureDetector(
                        onTap: () {
                          createQuestionOnline();

                        },
                        child: blueButton(context, 'Create Question', MediaQuery.of(context).size.width)),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
