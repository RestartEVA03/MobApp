import 'package:flutter/foundation.dart';


class Question {
  final int id;
  final String title;
  final List<Map<String, dynamic>> answers;

  Question({
    required this.title,
    required this.answers,
    required this.id
  });
}

class QuestionData {
  final _data = [
    Question(title: "Хочешь услышать рекомендацию по погоде?", answers: [
      {'answer' : 'Да', 'next': 7},
      {'answer': 'Нет', 'next': 1},
    ], id: 0,),
    Question(title: "Ты любишь спокойную музыку?", answers: [
      {'answer' : 'Да', 'next': 2},
      {'answer': 'Нет', 'next': 3},
    ], id: 1,),
    Question(title: "Слушаешь народные песни?", answers: [
      {'answer' : 'Да', 'next': 4},
      {'answer': 'Нет', 'next': 5},
    ], id: 2),
    Question(title: "Нравится AC/DC?", answers: [
      {'answer' : 'Да', 'next': 8},
      {'answer': 'Нет', 'next': 6},
    ], id: 3),
    Question(title: "Предпочитаешь русскую музыку?", answers: [
      {'answer' : 'Да', 'next': 9},
      {'answer': 'Нет', 'next': 10},
    ], id: 4),
    Question(title: "Знаешь кто такой Рэй Чарльз?", answers: [
      {'answer' : 'Да', 'next': 11},
      {'answer': 'Нет', 'next': 12},
    ], id: 5),
    Question(title: "Любишь боллее тяжелую музыку?", answers: [
      {'answer' : 'Да', 'next': 13},
      {'answer': 'Нет', 'next': 14},
    ], id: 6),
  ];

  List<Question> get questions => [..._data];


}