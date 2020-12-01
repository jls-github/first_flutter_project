import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Green", 'score': 10},
        {"text": "Blue", "score": 5},
        {"text": "Yellow", "score": 1}
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"text": "Rabbit", "score": 1},
        {"text": "Snake", "score": 5},
        {"text": "Elephant", "score": 7},
        {"text": "Lion", "score": 10}
      ]
    },
    {
      "questionText": "Where do you live?",
      "answers": [
        {"text": "USA", "score": 7},
        {"text": "Canada", "score": 8}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() => _questionIndex = _questionIndex + 1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Center(
                child: Result(_totalScore),
              ),
      ),
    );
  }
}
