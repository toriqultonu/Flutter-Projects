import 'package:e_learn/widgets/appBar.dart';
import 'package:e_learn/widgets/blueButton.dart';
import 'package:flutter/material.dart';

class AddQuestion extends StatefulWidget {

  static String id = 'addQustion';
  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: Form(
       // key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              TextFormField(
                validator: (value){ return value.isEmpty ? "Enter the question": null;},
                decoration: InputDecoration(
                  hintText: 'Question ',
                ),
                onChanged: (value) {

                },
              ),
              SizedBox(
                height: 18,
              ),
              TextFormField(
                validator: (value) {
                  return value.isEmpty
                      ? "Enter option1"
                      : null;
                },
                decoration: InputDecoration(
                  hintText: 'option 1',
                ),
                onChanged: (value) {

                },
              ),
              SizedBox(
                height: 18,
              ),
              TextFormField(
                validator: (value) {
                  return value.isEmpty
                      ? "Enter option2"
                      : null;
                },
                decoration: InputDecoration(
                  hintText: 'option 2',
                ),
                onChanged: (value) {

                },
              ),
              SizedBox(
                height: 18,
              ),
              TextFormField(
                validator: (value) {
                  return value.isEmpty
                      ? "Enter option3"
                      : null;
                },
                decoration: InputDecoration(
                  hintText: 'option 3',
                ),
                onChanged: (value) {

                },
              ),
              SizedBox(
                height: 18,
              ),
              TextFormField(
                validator: (value) {
                  return value.isEmpty
                      ? "Enter option4"
                      : null;
                },
                decoration: InputDecoration(
                  hintText: 'option 4',
                ),
                onChanged: (value) {

                },
              ),
              Spacer(),
              Row(
                children: [
                  
                ],
              ),
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
