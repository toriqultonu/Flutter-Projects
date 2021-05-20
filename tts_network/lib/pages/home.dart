import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isAuth = false;

  @override
  void initState(){
    super.initState();
      googleSignIn.onCurrentUserChanged.listen((account) {
        if(account != null){
          print('User signed in : $account');
          setState(() {
            isAuth = true;
          });
        }
        else{
          setState(() {
            isAuth = false;
          });
        }
      });
  }

  login(){
    print('Taped');
    googleSignIn.signIn();
  }

  Widget buildAuthScreen() {
    return Text('Authenticated');
  }

  Scaffold buildUnAuthScreen(){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: SweepGradient(
            colors: [Colors.blue, Colors.green, Colors.yellow, Colors.red, Colors.blue],
            stops: [0.0, 0.25, 0.5, 0.75, 1],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('tts_Network', style: TextStyle(fontFamily: "Signatra", fontSize: 90, color: Colors.white) ,),

            GestureDetector(
              onTap: (){
                login();
              },
              child: Container(
                width: 260,
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/google_signin_button.png'),
                    fit: BoxFit.cover
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }


}
