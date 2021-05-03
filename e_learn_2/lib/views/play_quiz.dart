import 'package:e_learn/widgets/appBar.dart';
import 'package:flutter/material.dart';

class PlayQuiz extends StatefulWidget {

  final String quizID;
  PlayQuiz(this.quizID);

  @override
  _PlayQuizState createState() => _PlayQuizState();
}

class _PlayQuizState extends State<PlayQuiz> {

  @override
  void initState() {
    print("${widget.quizID}");
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
      body: Container(),
    );
  }
}
