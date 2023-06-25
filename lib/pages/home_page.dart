import 'package:first_proj/models/Question.dart';
import 'package:first_proj/widgets/answer.dart';
import 'package:flutter/material.dart';

import '../widgets/quiz.dart';
import '../widgets/result.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final QuestionData data = QuestionData();
  int _countResult = 0;
  int _questionIndex = 0;

  List<Icon> _icons = [];

  _clearState() => setState(() {
        _questionIndex = 0;
        _countResult = 0;
        _icons = [];
      });

  void _onChangeAnswer(int id) => setState(() {
        _icons.add(Icon(Icons.brightness_1, color: Color(0xFF000000)));
        _questionIndex = id;
      });

  final whiteTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: SafeArea(
        child: DefaultTextStyle.merge(
          style: whiteTextStyle,
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              color: const Color(0xff2a375a),
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _questionIndex < 7
                    ?
                Quiz(
                  index: _questionIndex,
                  questionData: data,
                  onChangeAnswer: _onChangeAnswer,
                )
                    :
                Result(
                      result: _questionIndex,
                      onClearState: _clearState,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
