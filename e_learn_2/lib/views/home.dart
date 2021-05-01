import 'package:e_learn/services/database.dart';
import 'package:e_learn/views/create_question.dart';
import 'package:e_learn/widgets/appBar.dart';
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
      child: StreamBuilder(
        stream: qsnStream,
        builder: (context, snapshot){
          return snapshot.data == null ? Container():
              ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index){
                  return QsnTitle(imgUrl: snapshot.data.docs[index].data()["qsnImgURL"],
                      title: snapshot.data.docs[index].data()["qsnTitle"],
                      desc: snapshot.data.docs[index].data()["qsnDescript"]);
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
  QsnTitle({@required this.imgUrl, @required this.title, @required this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.network(imgUrl),
          Container(
            child: Column(
              children: [
                Text(title),
                Text(desc),
              ],
            ),
          )
        ],
      ),
    );
  }
}
