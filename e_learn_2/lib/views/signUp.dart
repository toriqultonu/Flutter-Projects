import 'package:e_learn/views/home.dart';
import 'package:e_learn/widgets/appBar.dart';
import 'package:e_learn/widgets/blueButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUP extends StatefulWidget {
  static String id = 'SignUp';
  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {

  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String name,email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Spacer(),
              TextFormField(
                validator: (value){ return value.isEmpty ? "Enter correct name": null;},
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
                onChanged: (value){
                  name = value;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (value){ return value.isEmpty ? "Enter correct email": null;},
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                onChanged: (value){
                  email = value;
                },
              ),
              SizedBox(height: 6,),
              TextFormField(
                obscureText: true,
                validator: (value){ return value.isEmpty ? "Enter correct passwrod": null;},
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                onChanged: (value){
                  password = value;
                },
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () async {
                  try{
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if(newUser != null){
                      Navigator.pushNamed(context, HomePage.id);
                    }
                  }
                  catch(e){
                    print(e);
                  }
                },
                child: blueButton(context, 'Sign Up'),
              ),
              SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?', style: TextStyle(fontSize: 16),),
                  SizedBox(width: 7,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                      child: Text('Sign In',style: TextStyle(color: Colors.blueAccent,fontSize: 16, decoration: TextDecoration.underline),)),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
