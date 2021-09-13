import 'package:pageviewdemo/constant.dart';
import 'package:flutter/material.dart';

class DataTitle extends StatelessWidget {

  String title;

  DataTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: kSidePadding,
      child: Text(
        title, style: TextStyle( fontSize: kTitleFontSize, color: Colors.black87, fontWeight: kTitleFontWeight, decoration: TextDecoration.underline),
      ),
    );
  }
}
