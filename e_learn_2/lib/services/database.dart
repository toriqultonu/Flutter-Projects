import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  Future<void> addQuestionData(Map questionData, String questionID) async {
    await FirebaseFirestore.instance.collection("E_Learners").doc(questionID).set(questionData).catchError((e){
      print(e.toString());
    });
  }
}