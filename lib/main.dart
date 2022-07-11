import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          centerTitle: true,
         title: const Text('My Dice', style: TextStyle(fontSize: 20)),
          backgroundColor: Colors.black,
        ),
        body:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/FlutterIcon.png"),
            ),
          ),
          child:const DicePage(),
        ),

      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int DisplayNumber = 0;
  var BravoColor = Colors.transparent;
  var BravoTextColor = Colors.transparent;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      if(leftDiceNumber == rightDiceNumber) {
        BravoColor = Colors.red;
        BravoTextColor = Colors.black;
        DisplayNumber = (leftDiceNumber + rightDiceNumber)*2;
      }
      else{
        BravoColor = Colors.transparent;
        BravoTextColor = Colors.transparent;
        DisplayNumber = leftDiceNumber + rightDiceNumber;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Text("BRAVO", style: TextStyle(fontSize: 30, color: BravoTextColor),textAlign: TextAlign.center,),
              padding: EdgeInsets.only(top:30, bottom: 30, left: 200, right: 200),
              color: BravoColor,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    child: Image.asset(
                      'images/dice$leftDiceNumber.png',
                    ),
                    onPressed: () {
                      changeDiceFace();
                    },
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: Image.asset(
                      'images/dice$rightDiceNumber.png',
                    ),
                    onPressed: () {
                      changeDiceFace();
                    },
                  ),
                ),
              ],
            ),
            Container(
              child: Text("$DisplayNumber",style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold,),
                textAlign: TextAlign.center,),
              height: 100,
              width: 1000,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
