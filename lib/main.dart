import 'package:first_proj/pages/home_page.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = false;
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizeeee',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          caption: TextStyle(fontSize: 22.0, color: Colors.white),
        ),
        fontFamily: 'Georgia',
      ),
      home: HomePage(),
    );
  }
}
