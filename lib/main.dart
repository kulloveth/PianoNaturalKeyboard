import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Piano App',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Piano(title: 'Natural Keys'),
    );
  }
}

class Piano extends StatefulWidget {
  Piano({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PianoState createState() => _PianoState();
}

class _PianoState extends State<Piano> {


  SizedBox pianoButton(String note,String soundNote) {
    return SizedBox(
      width: 50.0,
      height: 200.0,
      child: OutlinedButton(
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(note,style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
            )),
        style: OutlinedButton.styleFrom(
            primary: Colors.black,
            backgroundColor: Colors.white,
            side: BorderSide(color: Colors.black, width: 2),
            textStyle: TextStyle()),
        onPressed: () {
          setState(() {
            playSound(soundNote);
          });
          },
      ),
    );
  }

  Positioned rightBlackButton(){
    return  Positioned(
      right: 30,
      child: Container(
        width: 30.0,
        height: 100.0,
        color: Colors.black,
      ),
    );
  }

  Positioned leftBlackButton(){
    return  Positioned(
      left: 30,
      child: Container(
        width: 30.0,
        height: 100.0,
        color: Colors.black,
      ),
    );
  }

  void playSound(String soundNumber) {
    final player = AudioCache();
    player.play('note_$soundNumber.wav');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    pianoButton('C','c'),
                    leftBlackButton(),
                  ],
                ),
                Stack(
                  children: [
                    pianoButton('D','d'),
                    leftBlackButton(),
                    rightBlackButton(),
                  ],
                ),

                Stack(children: [
                  pianoButton('E','e'),
                 rightBlackButton(),
                ],),
                Stack(
                  children: [
                    pianoButton('F','f'),
                   leftBlackButton(),
                  ],
                ),
                Stack(
                  children: [
                    pianoButton('G','g'),
                   leftBlackButton(),
                    rightBlackButton(),
                  ],
                ),
                Stack(
                  children: [
                    pianoButton('A','a'),
                    leftBlackButton(),
                   rightBlackButton(),
                  ],
                ),

                Stack(children: [
                  pianoButton('B','b'),
                  rightBlackButton(),
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
