import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": ["Green", "Blue", "Yellow"]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": ["Rabbit", "Snake", "Elephant", "Lion"]
    },
    {
      "questionText": "Where do you live?",
      "answers": ["USA", "Canada"]
    }
  ];

  var _questionIndex = 0;

  void _answerQuestion() => setState(() => _questionIndex = _questionIndex + 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: <Widget>[
                  Question(questions[_questionIndex]["questionText"]),
                  ...(questions[_questionIndex]["answers"] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }),
                ],
              )
            : Center(
                child: Text("You did it!"),
              ),
      ),
    );
  }
}
