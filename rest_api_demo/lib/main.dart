import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api_demo/services/notes_service.dart';
import 'package:rest_api_demo/views/note_list.dart';
import 'package:flutter/cupertino.dart';

void setupLocator(){

  GetIt.instance.registerLazySingleton(() => NoteService());

}

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: NoteList(),
    );
  }
}

