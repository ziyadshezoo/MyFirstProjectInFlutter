import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatefulWidget {
  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  int PointELsaman = 0;
  int PointElshazly = 0;
  String FirstTeam = 'Ziyad Elshazly';
  String SecondTeam = 'Ziyad Elsaman';

  static const MaxSecond = 15;
  int Seconds = MaxSecond;
  Timer? timer;
  final player = AudioPlayer();
  final player2 = AudioPlayer();
  bool k = true;
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer) {
      if (Seconds > 0) {
        setState(() => Seconds--);
      }
    });
  }

  void StopTimer() {
    timer?.cancel();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 248, 242),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 25, 59, 29),
          title: Center(
              child: Text(
            "EL Abakra - Final",
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 40,
                fontFamily: "Marcellus"),
          )),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //########### TOP LEFT ###########
                Column(
                  children: [
                    CircleAvatar(
                      radius: 95,
                      backgroundColor: Color.fromARGB(255, 39, 1, 252),
                      child: CircleAvatar(
                        radius: 90,
                        backgroundImage:
                            AssetImage("assets/Ziyad Elshazly.jpg"),
                      ),
                    ),
                    Text(
                      "$FirstTeam",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Marcellus",
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Text(
                      "$PointElshazly",
                      style: TextStyle(fontSize: 140, fontFamily: "Kanit"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 25, 59, 29),
                            minimumSize: Size(130, 40),
                          ),
                          onPressed: () {
                            setState(() {
                              PointElshazly += 5;
                            });
                          },
                          child: Text("Add 5 Point",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255)))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(130, 40),
                            primary: Color.fromARGB(255, 25, 59, 29),
                          ),
                          onPressed: () {
                            PointElshazly -= 5;
                            setState(() {});
                          },
                          child: Text("Minus 5 Point",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255)))),
                    ),
                  ],
                ),
                Column(children: [
                  Text(
                    "The Timer",
                    style: TextStyle(fontFamily: "Marcellus", fontSize: 60),
                  ),
                  Container(
                      child: Seconds >= 10
                          ? Text("00 : $Seconds",
                              style: TextStyle(
                                  fontSize: 200, fontFamily: "Digital"))
                          : Text("00 : 0$Seconds",
                              style: TextStyle(
                                  fontSize: 200, fontFamily: "Digital"))),

                  // }//################### that is 15 button ####################################
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(130, 40),
                              primary: Color.fromARGB(255, 25, 59, 29),
                            ),
                            onPressed: () {
                              k = true;
                              player2.pause();
                              Seconds = 15;
                              player.play(AssetSource("Count.mp3"));
                              startTimer();
                            },
                            child: Text("Start Timer 15")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(130, 40),
                              primary: Color.fromARGB(255, 25, 59, 29),
                            ),
                            onPressed: () {
                              Seconds = 20;
                              //final player = AudioPlayer();
                              player.pause();
                              // Seconds = 20;
                              k = false;
                              Future.delayed(Duration(seconds: 1));
                              startTimer();

                              player2.play(AssetSource("Count20.mp3"));
                              //Seconds = 20;
                            },
                            child: Text("Start Timer 20")),
                      ),
                    ],
                  ),
                  // ################ that is 20 button ###############################
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 25, 59, 29),
                            minimumSize: Size(130, 40),
                          ),
                          onPressed: () {
                            player.pause();
                            player2.pause();
                            StopTimer();
                            setState(() {
                              Seconds = 15;
                            });
                          },
                          child: Text(
                            "Reset 15",
                            // style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 25, 59, 29),
                                minimumSize: Size(130, 40),
                              ),
                              onPressed: () {
                                player.pause();
                                player2.pause();
                                StopTimer();
                                setState(() {
                                  Seconds = 20;
                                  //Seconds = 15;
                                });
                              },
                              child: Text(
                                "Reset 20",
                                // style: TextStyle(color: Colors.black),
                              )))
                    ],
                  ),
                ]),

                //############## TOP RIGHT ############
                Column(children: [
                  CircleAvatar(
                    radius: 95,
                    backgroundColor: Color.fromARGB(255, 252, 1, 1),
                    child: CircleAvatar(
                      radius: 90,
                      backgroundImage: AssetImage("assets/Ziad Elsayed.jpeg"),
                    ),
                  ),
                  Text(
                    "$SecondTeam",
                    style: TextStyle(fontSize: 30, fontFamily: "Marcellus"),
                  ),
                  Text(
                    "$PointELsaman",
                    style: TextStyle(fontSize: 140, fontFamily: "Kanit"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(130, 40),
                          primary: Color.fromARGB(255, 25, 59, 29),
                        ),
                        onPressed: () {
                          // final player4 = AudioPlayer();
                          //player4.play(AssetSource("1.mp3"));
                          PointELsaman += 5;
                          setState(() {});
                        },
                        child: Text("Add 5 Point",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(130, 40),
                          primary: Color.fromARGB(255, 25, 59, 29),
                        ),
                        onPressed: () {
                          //final player = AudioPlayer();
                          //player.play(AssetSource("3.mp3"));
                          PointELsaman -= 5;
                          setState(() {});
                        },
                        child: Text("Minus 5 Point",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)))),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(5.0),
                  //   child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //         minimumSize: Size(130, 40),
                  //         primary: Colors.orange,
                  //       ),
                  //       onPressed: () {
                  //         final player = AudioPlayer();
                  //         player.play(AssetSource("1.mp3"));
                  //         PointELsaman += 3;
                  //         setState(() {});
                  //       },
                  //       child: Text("Add 3 Points",
                  //           style: TextStyle(color: Colors.black))),
                  // ),
                ]),
              ],
            ),
            //############################# RESET BUTTON ##########################
          ],
        ),
      ),
    );
  }
}
