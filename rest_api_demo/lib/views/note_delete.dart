import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning'),
      content: Text('Are you sure you want ot delete this note?'),
      actions: [
        FlatButton(
          child: Text('Yes'),
          onPressed: (){
            Navigator.of(context).pop(true);
          },
        ),
        FlatButton(
          child: Text('No'),
          onPressed: (){
            Navigator.of(context).pop(false);
          },
        )
      ],
    );
  }
}
