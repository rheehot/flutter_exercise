import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftNumber = 1;
  int rightNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                getNumber();
              },
              child: Image.asset('images/dice$leftNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                getNumber();
              },
              child: Image.asset('images/dice$rightNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
  void getNumber() {
    setState(() {
      this.leftNumber = Random().nextInt(6) + 1;
      this.rightNumber = Random().nextInt(6) + 1;
    });
  }
}
