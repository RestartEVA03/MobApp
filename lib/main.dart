import 'package:first_proj/pages/home_page.dart';
import 'package:first_proj/screens/weather_screen.dart';
import 'package:flutter/material.dart';

import 'db/app_database.dart';
import 'db/database_provider.dart';
import 'db/entity/question_entity.dart';
import 'models/Question.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  insertData();

  runApp(MyApp());
}

void insertData() async {

  final databaseProvider = DatabaseProvider();
  final database = await databaseProvider.database;

  final questionDao = database.questionDao;


  final _data = [
    Question(
      title: "Хочешь услышать рекомендацию по погоде?",
      answers: [
        {'answer': 'Да', 'next': 7},
        {'answer': 'Нет', 'next': 1},
      ],
      id: 0,
    ),
    Question(
      title: "Ты любишь спокойную музыку?",
      answers: [
        {'answer': 'Да', 'next': 2},
        {'answer': 'Нет', 'next': 3},
      ],
      id: 1,
    ),
    Question(
      title: "Слушаешь народные песни?",
      answers: [
        {'answer': 'Да', 'next': 4},
        {'answer': 'Нет', 'next': 5},
      ],
      id: 2,
    ),
    Question(
      title: "Нравится AC/DC?",
      answers: [
        {'answer': 'Да', 'next': 8},
        {'answer': 'Нет', 'next': 6},
      ],
      id: 3,
    ),
    Question(
      title: "Предпочитаешь русскую музыку?",
      answers: [
        {'answer': 'Да', 'next': 9},
        {'answer': 'Нет', 'next': 10},
      ],
      id: 4,
    ),
    Question(
      title: "Знаешь кто такой Рэй Чарльз?",
      answers: [
        {'answer': 'Да', 'next': 11},
        {'answer': 'Нет', 'next': 12},
      ],
      id: 5,
    ),
    Question(
      title: "Любишь более тяжелую музыку?",
      answers: [
        {'answer': 'Да', 'next': 13},
        {'answer': 'Нет', 'next': 14},
      ],
      id: 6,
    ),
  ];

  final questionEntities = _data.map((question) => QuestionEntity(
    id: question.id,
    title: question.title,
    answers: question.answers,
  )).toList();

  await questionDao.insertAllQuestions(questionEntities);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Weather'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeatherPage()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Quiz'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}