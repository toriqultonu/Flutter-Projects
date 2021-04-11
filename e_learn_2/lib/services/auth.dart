import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future signEmailAndPassword(String email, String password) async {

    try{
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return user;
    }
    catch(e){
      print(e.toString());
    }
  }
}