import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

void main() => runApp(QuizApp());

QuizBrain quizBrain = QuizBrain();

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

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      if (quizBrain.isLastQuestionReached() == true) {
        Alert(context: context, title: 'Quiz', desc: 'Quiz is ended!').show();
        scoreKeeper = [];
        quizBrain.resetQuestionNumber();
      } else {
        quizBrain.nextQuestion();
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(new Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(new Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
      }
    });
  }

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
                  quizBrain.getQuestionText(),
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
                        checkAnswer(true);
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
                        checkAnswer(false);
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
