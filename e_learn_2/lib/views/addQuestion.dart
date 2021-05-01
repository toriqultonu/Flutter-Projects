import 'package:e_learn/services/database.dart';
import 'package:e_learn/widgets/appBar.dart';
import 'package:e_learn/widgets/blueButton.dart';
import 'package:flutter/material.dart';

class AddQuestion extends StatefulWidget {
 // static String id = 'addQustion';
   String qsnID;

  AddQuestion(this.qsnID);

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {

  final _formKey = GlobalKey<FormState>();
  String question, option1, option2, option3, option4;
  bool _isloading = false;

  DatabaseService databaseService = new DatabaseService();

  uploadQSNData(){
    if(_formKey.currentState.validate()){

      setState(() {
        _isloading = true;
      });

      Map<String, String> questionMap = {
        "question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4
      };

      databaseService.addQSNData(questionMap, widget.qsnID.toString()).then((value){
        setState(() {
          _isloading = false;
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
      body: _isloading? Container(
        child: Center(child: CircularProgressIndicator(),),
      ) : Form(
         key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  return value.isEmpty ? "Enter the question" : null;
                },
                decoration: InputDecoration(
                  hintText: 'Question ',
                ),
                onChanged: (value) {
                  question = value;
                },
              ),
              SizedBox(
                height: 18,
              ),
              TextFormField(
                validator: (value) {
                  return value.isEmpty ? "Enter option1" : null;
                },
                decoration: InputDecoration(
                  hintText: 'option 1',
                ),
                onChanged: (value) {
                  option1 = value;
                },
              ),
              SizedBox(
                height: 18,
              ),
              TextFormField(
                validator: (value) {
                  return value.isEmpty ? "Enter option2" : null;
                },
                decoration: InputDecoration(
                  hintText: 'option 2',
                ),
                onChanged: (value) {
                  option2 = value;
                },
              ),
              SizedBox(
                height: 18,
              ),
              TextFormField(
                validator: (value) {
                  return value.isEmpty ? "Enter option3" : null;
                },
                decoration: InputDecoration(
                  hintText: 'option 3',
                ),
                onChanged: (value) {
                  option3 = value;
                },
              ),
              SizedBox(
                height: 18,
              ),
              TextFormField(
                validator: (value) {
                  return value.isEmpty ? "Enter option4" : null;
                },
                decoration: InputDecoration(
                  hintText: 'option 4',
                ),
                onChanged: (value) {
                  option4 = value;
                },
              ),
              Spacer(),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: blueButton(context, "Submit",
                        MediaQuery.of(context).size.width / 2 - 36),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: (){
                      uploadQSNData();
                    },
                    child: blueButton(context, "Add Question",
                        MediaQuery.of(context).size.width / 2 - 36),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
