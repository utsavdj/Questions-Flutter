import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Blue', 'score': 2},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 4},
        {'text': 'Black', 'score': 10},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Horse', 'score': 5},
        {'text': 'Elephant', 'score': 9},
        {'text': 'Lion', 'score': 11},
      ]
    },
    {
      'questionText': 'Who\'s your favorite person?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'John', 'score': 1},
        {'text': 'Emma', 'score': 1},
        {'text': 'Megan', 'score': 1},
      ]
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if ((_questionIndex < _questions.length)) {
      print('We have more questions!');
    } else {
      print('We have no more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
