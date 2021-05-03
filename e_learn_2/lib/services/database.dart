import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{


  Future<void> addQuestionData(Map questionData, String qsnID) async {
    await FirebaseFirestore.instance.collection("E_Learners").doc(qsnID).set(questionData).catchError((e){
      print(e.toString());
    });
  }

  Future<void> addQSNData(Map qsnData, String qsnID) async {
    await FirebaseFirestore.instance.collection("E_Learners").doc(qsnID).collection("QNA").add(qsnData).catchError((e){
      print(e.toString());
    });
  }

  Future getQsnData() async {
    return await FirebaseFirestore.instance.collection("E_Learners").snapshots();
  }

  getTestData(String quizID) async {
    return await FirebaseFirestore.instance.collection("E_Learners").doc(quizID).collection("QNA").get();
  }
}