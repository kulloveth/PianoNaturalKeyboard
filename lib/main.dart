import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
  SizedBox pianoButton(String note) {
    return SizedBox(
      width: 50.0,
      height: 200.0,
      child: OutlinedButton(
        child: Align(

            alignment:Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Text(note ),
            )),
        style: OutlinedButton.styleFrom(
            primary: Colors.black,
            backgroundColor: Colors.white,
            side: BorderSide(color: Colors.blue, width: 2),
            textStyle: TextStyle()),
        onPressed: () {
          print('Pressed');
        },
      ),
    );
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [pianoButton('C'), pianoButton('D'), pianoButton('E'),pianoButton('F'),pianoButton('G'),pianoButton('A'),pianoButton('B')],
          ),
        ),
      ),
    );
  }
}