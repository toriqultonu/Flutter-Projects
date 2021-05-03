import 'package:e_learn/services/database.dart';
import 'package:e_learn/views/create_question.dart';
import 'package:e_learn/views/play_quiz.dart';
import 'package:e_learn/widgets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String id = 'homePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Stream qsnStream;
  DatabaseService databaseService = new DatabaseService();

  Widget qsnList(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: StreamBuilder(
        stream: qsnStream,
        builder: (context, snapshot){
          return snapshot.data == null ? Container():
              ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index){
                  return QsnTitle(imgUrl: snapshot.data.docs[index].data()["qsnImgURL"],
                      title: snapshot.data.docs[index].data()["qsnTitle"],
                      desc: snapshot.data.docs[index].data()["qsnDescript"],
                      quizID: snapshot.data.docs[index].data()["qsnID"],);
                },
              );
        },
      ),
    );
  }

  @override
  void initState() {
    databaseService.getQsnData().then((value){
      setState(() {
        qsnStream = value;
      });
    }

    );
    super.initState();
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
      body: qsnList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, CreateQuestions.id);
        }

      ),
    );
  }
}

class QsnTitle extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String desc;
  final String quizID;
  QsnTitle({@required this.imgUrl, @required this.title, @required this.desc, @required this.quizID});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => PlayQuiz(quizID)
          ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        height: 150,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
                child: Image.network(imgUrl, width: MediaQuery.of(context).size.width - 48 , fit: BoxFit.cover,)),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.black26),

              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
                  SizedBox(height: 5,),
                  Text(desc, style: TextStyle(color: Colors.white, fontSize: 14),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
