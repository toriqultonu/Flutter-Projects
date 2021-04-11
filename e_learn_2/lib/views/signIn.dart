import 'package:e_learn/views/home.dart';
import 'package:e_learn/views/signUp.dart';
import 'package:e_learn/widgets/appBar.dart';
import 'package:e_learn/widgets/blueButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  static String id = 'SignIn';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String email, password;

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
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return value.isEmpty ? "Enter correct email" : null;
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  return value.isEmpty ? "Enter correct passwrod" : null;
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, HomePage.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: blueButton(context, 'Sign In'),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignUP.id);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 16,
                            decoration: TextDecoration.underline),
                      )),
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
