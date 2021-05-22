import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tts_network/widgets/header.dart';
import 'package:tts_network/widgets/progress.dart';

final userRef = FirebaseFirestore.instance.collection('user');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {

  @override
  void initState() {
    super.initState();
    //createUser();
    deleteUser();
   // updateUser();
  }

  createUser() async {
    userRef.doc("balernamedhari").set({
      "username" : "Baler name",
      "postCount": 0,
      "isAdmin" : false
    });
  }

  updateUser() async {
    final DocumentSnapshot docs = await userRef.doc("IjOb6TgqGW8s6q9uIS3o").get();
    if(docs.exists){
        docs.reference.update({
          "username" : "name updated agian"
        });
    }
    //     .update({
    //   "username" : "Updated baler name"
    // });
  }

  deleteUser() async{
    final DocumentSnapshot doc = await userRef.doc("IjOb6TgqGW8s6q9uIS3o").get();
        // .delete();
    if(doc.exists){
      doc.reference.delete();
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: StreamBuilder<QuerySnapshot>(
        stream: userRef.snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return circularProgress();
          }
          final List<Text> children = snapshot.data.docs.map((doc) => Text(doc["username"])).toList();
          return Container(
            child: ListView(
                children: children
            ),
          );
        },
      )
    );
  }
}
