import 'package:rest_api_demo/models/note_for_listing.dart';

class NoteService{

  List<NoteForListing> getNotesList(){
    return [
      new NoteForListing("1", "Note 1", DateTime.now(), DateTime.now()),
      new NoteForListing("2", "Note 2", DateTime.now(), DateTime.now()),
      new NoteForListing("3", "Note 3", DateTime.now(), DateTime.now()),
      new NoteForListing("4", "Note 4", DateTime.now(), DateTime.now()),
      new NoteForListing("5", "Note 5", DateTime.now(), DateTime.now()),
    ];
  }
}