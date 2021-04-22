import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api_demo/models/note_for_listing.dart';
import 'package:rest_api_demo/services/notes_service.dart';
import 'package:rest_api_demo/views/note_delete.dart';
import 'package:rest_api_demo/views/note_modify.dart';

class NoteList extends StatelessWidget {

  NoteService get service => GetIt.instance<NoteService>();

  final notes = [
    new NoteForListing("1", "Note 1", DateTime.now(), DateTime.now()),
    new NoteForListing("2", "Note 2", DateTime.now(), DateTime.now()),
    new NoteForListing("3", "Note 3", DateTime.now(), DateTime.now()),
    new NoteForListing("4", "Note 4", DateTime.now(), DateTime.now()),
    new NoteForListing("5", "Note 5", DateTime.now(), DateTime.now()),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List of notes'),),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => NoteModify()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider( color: Colors.green,),
        itemBuilder: (_, index){
          return Dismissible(
            key: ValueKey(notes[index].noteID),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction){
            },
            confirmDismiss: (direction) async {
              final result = await showDialog(
                  context: context,
                  builder: (_) => NoteDelete()
              );
              return result;
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(left: 16),
              child: Align(child: Icon(Icons.delete, color: Colors.white), alignment: Alignment.centerLeft,),
            ),
            child: ListTile(
              title: Text(
                notes[index].noteTitle,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              subtitle: Text('Last edited on ${notes[index].latestEditDateTime}'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => NoteModify(noteID: notes[index].noteID)));
              },
            ),
          );
        },
        itemCount: notes.length,
      ),
    );
  }
}
