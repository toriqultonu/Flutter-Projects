import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tts_network/pages/activity_feed.dart';
import 'package:tts_network/pages/profile.dart';
import 'package:tts_network/pages/search.dart';
import 'package:tts_network/pages/timeline.dart';
import 'package:tts_network/pages/upload.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isAuth = false;
  PageController pageController;
  int pageIndex = 0;

  @override
  void initState(){
    super.initState();
    pageController = PageController();
    // Detects when user signed in.
      googleSignIn.onCurrentUserChanged.listen((account) {
          handleSignIn(account);
      },
      onError: (err){
        print('Error signing with google in: $err');
      });
      // Re-authenticate user when app is opened
      googleSignIn.signInSilently(suppressErrors: false).then((account){
          handleSignIn(account);
      }).catchError((err){
        print('Error signing with google in: $err');
      });
  }

  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }

  handleSignIn(GoogleSignInAccount account){
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
  }

  login(){
    googleSignIn.signIn();
  }
  logout(){
    googleSignIn.signOut();
  }

  onPageChanged(int pageIndex){
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex){
    pageController.animateToPage(pageIndex, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  Scaffold buildAuthScreen() {
    return Scaffold(
      body: PageView(
        children: [
          Timeline(),
          ActivityFeed(),
          Upload(),
          Search(),
          Profile(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.whatshot),),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active),),
          BottomNavigationBarItem(icon: Icon(Icons.photo_camera, size: 35.0,),),
          BottomNavigationBarItem(icon: Icon(Icons.search),),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),),
        ],
      ),
    );
    //   RaisedButton(onPressed: logout,
    // child: Text('Logout'),);
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
