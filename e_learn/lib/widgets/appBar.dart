import 'package:flutter/material.dart';

Widget appBar(BuildContext context){
  return Center(
    child: RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 22),
        children: <TextSpan>[
          TextSpan( text: 'E-', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
          TextSpan( text: 'Learners', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent))
        ]
      )
    ),
  );
}