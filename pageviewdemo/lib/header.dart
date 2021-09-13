import 'package:pageviewdemo/constant.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {

  String header;
  Header({this.header});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: kSidePadding,
        child: Text(
          header, style: TextStyle(fontSize: kHeaderFontSize, color: Colors.black87, fontWeight: kHeaderFontWeight),
        ),
      ),
    );
  }
}
