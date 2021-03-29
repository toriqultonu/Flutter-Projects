import 'dart:async';
import 'package:flappybird/bird.dart';
import 'package:flutter/material.dart';
import 'barriers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;
  static double barrierXone = 0.5;
  static double barrierXtwo = 0.5;
  static double barrierXthree = 2;
  static double barrierXfour = 2;
  static int bestscore =0 ;
  int score = 0;
  double time = 0;
  double height = 0;
  double initialheight = birdYaxis;
  bool gameHasStarted = false;

  void jump() {
    setState(() {
      time = 0;
      initialheight = birdYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time += 0.04;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdYaxis = initialheight - height;
        if(barrierXone < -1.6){
          score += 1;
          barrierXone += 3.15;
        }
        else
          barrierXone -= 0.03;
        if(barrierXtwo < -1.6){
          barrierXtwo += 3.15;
        }
        else
          barrierXtwo -= 0.03;

        if(barrierXthree < -1.6){
          score += 1;
          barrierXthree += 3.15;
        }
        else
          barrierXthree -= 0.03;
        if(barrierXfour < -1.6){
          barrierXfour += 3.15;
        }
        else
          barrierXfour -= 0.03;
      });
      if (birdYaxis > 1) {
        timer.cancel();
        if(score>bestscore)
          bestscore = score;
        gameHasStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Stack(children: [
                    AnimatedContainer(
                      alignment: Alignment(0, birdYaxis),
                      duration: Duration(milliseconds: 0),
                      color: Colors.blue,
                      child: MyBird(),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXone,-1.1),
                      duration: Duration(milliseconds: 0),
                      child: MyBarrier(
                        size: 200.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXtwo,1.1),
                      duration: Duration(milliseconds: 0),
                      child: MyBarrier(
                        size: 200.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXthree,-1.1),
                      duration: Duration(milliseconds: 0),
                      child: MyBarrier(
                        size: 270.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXfour,1.1),
                      duration: Duration(milliseconds: 0),
                      child: MyBarrier(
                        size: 130.0,
                      ),
                    ),
                    Container(
                      alignment: Alignment(0, -0.3),
                      child: gameHasStarted ? Text(''):Text(
                        'T A P  T O  P L A Y',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),

                  ])),
              Container(
                height: 15,
                color: Colors.green,
              ),
              Expanded(
                  child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SCORE',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$score',
                          style: TextStyle(color: Colors.white, fontSize: 26),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'BEST SCORE',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$bestscore',
                          style: TextStyle(color: Colors.white, fontSize: 26),
                        )
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
