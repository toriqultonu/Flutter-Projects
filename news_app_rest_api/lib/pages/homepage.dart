import 'package:flutter/material.dart';
import 'package:news_app_rest_api/services/api_manager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index){
            return Container(
              height: 100,
              color: Colors.red,
            );
          },
        ),
      ),
    );
  }
}
