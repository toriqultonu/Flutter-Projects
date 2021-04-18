import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {

  final String noteID;
  bool get isEditing => noteID != null;

  NoteModify({this.noteID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit note':'Create note'),),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(
              hintText: 'Note title'
            ),),
            SizedBox(height: 8,),

            TextField(
              decoration: InputDecoration(
                hintText: 'Note content'
              ),
            ),
            SizedBox(height: 18,),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 18),),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],

        ),
      )
    );
  }
}
