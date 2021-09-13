import 'package:pageviewdemo/constant.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {

  String description;

  Description({this.description});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: kSidePadding,
      child: Text(
        description, style: TextStyle(fontSize: kDescriptionFontSize,  color: Colors.black87),
      ),
    );
  }
}
