import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learn/controller/question.dart';
import 'package:e_learn/services/database.dart';
import 'package:e_learn/views/start_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';



// We use get package for our state management
class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  DatabaseService databaseService = new DatabaseService();
  QuerySnapshot questionSnapshot;
  final String quizID;

  List<Question> _questions;

  QuestionController(this.quizID){
    List<Question> questionList;
    databaseService.getTestData(quizID).then((value) {
      questionSnapshot = value;
      int i = 1;
      for (var document in questionSnapshot.docs) {
        List<String> options = [
          document.data()["option1"],
          document.data()["option2"],
          document.data()["option3"],
          document.data()["option4"]
        ];
        options.shuffle();
        Question question = new Question(i, document.data()["question"], i, options);
        questionList.add(question);
        i++;
      }
    });
    this._questions = questionList;
  }
  String _userName;
  String get userName => this._userName;

  set userName(String name) {
    this._userName = name;
  }

  // Lets animated our progress bar
  AnimationController _animationController;

  Animation _animation;
  // So that we can access our animation outside
  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAnswer;
  int get correctAnswer => this._correctAnswer;

  int _selectedAnswer;
  int get selectedAnswer => this._selectedAnswer;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numberOfCorrectAnswer = 0;
  int get numberOfCorrectAnswer => _numberOfCorrectAnswer;

  // List<Question> _questions = questionList
  //     .map((q) => Question(
  //           id: q['id'],
  //           question: q['question'],
  //           options: q['options'],
  //           answer: q['correct_answer'],
  //         ))
  //     .toList();


  List<Question> get questions => this._questions;
   // List<Question> questions = questionList;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s.
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAnswer(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAnswer = question.answer;
    _selectedAnswer = selectedIndex;

    if (_correctAnswer == _selectedAnswer) _numberOfCorrectAnswer++;

    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(microseconds: 250), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      //Get.to(() => ScorePage());
    }
  }

  void updateQuestionNumber(int index) {
    _questionNumber.value = index + 1;
  }
}
