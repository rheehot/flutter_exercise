import 'package:flutter/material.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: SafeArea(child: Quiz()),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Icon> scoreKeeper = [];
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
  ];
  List<bool> answers = [
    true,
    false,
    false,
  ];
  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 7,
          child: Container(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(50.0),
                child: Text(
                  questions[questionNumber],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                  height: 80.0,
                  color: Colors.green,
                  child: SizedBox.expand(
                    child: TextButton(
                      child: Text(
                        'True',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      onPressed: () {
                        bool correction = answers[questionNumber];
                        if (correction == true) {
                          print('You got it right!');
                        } else {
                          print('You got it wrong!');
                        }
                        setState(() {
                          scoreKeeper.add(
                            new Icon(Icons.check, color: Colors.green,),
                          );
                          questionNumber++;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                  height: 80.0,
                  color: Colors.red,
                  child: SizedBox.expand(
                    child: TextButton(
                      child: Text(
                        'False',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      onPressed: () {
                        bool correction = answers[questionNumber];
                        if (correction == false) {
                          print('You got it right!');
                        } else {
                          print('You got it wrong!');
                        }
                        setState(() {
                          scoreKeeper.add(
                              new Icon(Icons.close, color: Colors.red,)
                          );
                          questionNumber++;
                        });
                      },
                    ),
                  ),
                ),
              ],
            )),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
