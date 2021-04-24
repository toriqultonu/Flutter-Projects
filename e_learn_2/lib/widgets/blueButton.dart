import 'package:flutter/material.dart';

Widget blueButton(BuildContext context, String label, double buttonWidth){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 15),
    decoration: BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.circular(30),
    ),
    width: buttonWidth,
    alignment: Alignment.center,
    child: Text(
      '$label',
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
  );
}